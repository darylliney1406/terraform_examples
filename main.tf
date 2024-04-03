# # Calls module to create a RG, Vnet, Subnet, NSG and a single Windows Virtual Machine
# module "single_windows_vm" {
#   source = "./environments/two_windows_vms"
# }

# # Creates a break glass account, a conditional access policy and groups to allow emergency access to Azure
# module "break_glass" {
#   source = "./environments/break_glass_account"
# }

# module "vsphere" {
#   source           = "./environments/vsphere_test"
# }

# module "devops_agent" {
#   source           = "./environments/devops_agent"
# }