variable "resource_group" {
  default     = ""
  description = "Variable for creating lab resource group"
}

variable "resource_location" {
  default     = "UK South"
  description = "Azure resource location"
}

locals {
  tags = {
    ProvisionedBy = "SubwaveLabsTerraform"
    Location      = "UK South"
    Project       = "Lab Infrastructure"
  }
}

variable "vsphere_user" {
  default = ""
}

variable "vsphere_password" {
  default = ""
}

variable "vsphere_server" {
  default = ""
}

variable "access_key" {
  default = ""
  description = "aws access key"
}

variable "secret_key" {
  default = ""
  description = "aws secret key"
}

variable "product_key" {
  default = ""
}

variable "admin_password" {
  default = ""
}