resource "azurerm_network_security_group" "lab01_nsg" {
  name                = var.nsg_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "lab01_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "lab01_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.lab01_vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

output "subnet_output" {
  value = azurerm_subnet.lab01_subnet
}

resource "azurerm_subnet_network_security_group_association" "sn_association" {
  subnet_id                 = azurerm_subnet.lab01_subnet.id
  network_security_group_id = azurerm_network_security_group.lab01_nsg.id
}

resource "azurerm_network_security_rule" "rdp-inbound" {
  name                        = "Allow_RDP"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.lab01_nsg.name
}
