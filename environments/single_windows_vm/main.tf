# Call module from ../../modules/resource_group to create a resource group
module "resource_group" {
  source = "../../modules/resource_group"
}

# Call module from ../../modules/networking to create network elements including NSG, Vnet, Subnet
module "networking" {
  source                  = "../../modules/networking"
  resource_group_id       = module.resource_group.resource_group_id
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
}

# Call module from ../../modules/virtual_machine to create a virtual machine and PIP
module "virtual_machine" {
  source                  = "../../modules/virtual_machine"
  resource_group_id       = module.resource_group.resource_group_id
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id               = module.networking.subnet_output
}
