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

variable "rg_name" {
  default = "rg-subwave-labs-01"
}

variable "rg_location" {
  default = "UK South"
}
