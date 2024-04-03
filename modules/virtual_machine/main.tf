resource "azurerm_network_interface" "lab01_nic" {
  name                = var.nic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.lab01_pip.id
  }
}

resource "azurerm_windows_virtual_machine" "lab01_vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2_v2"
  admin_username      = "adminuser"
  admin_password      = "HappyMonday1!"
  network_interface_ids = [
    azurerm_network_interface.lab01_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "lab01_pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
}
