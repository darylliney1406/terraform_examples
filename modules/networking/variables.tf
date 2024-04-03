variable "resource_group_id" {
  description = "Resource Group value"
}

variable "resource_group_name" {
  description = "Resource Group value"
}

variable "resource_group_location" {
  description = "Resource Group value"
}

variable "vnet_name" {
  default     = "vnet-subwave-labs-01"
  description = "Set vnet name variable"
}

variable "subnet_name" {
  default     = "sn-subwave-labs-01"
  description = "Set subnet name variable"
}
variable "nsg_name" {
  default     = "nsg-subwave-labs-01"
  description = "Set nsg name variable"
}
