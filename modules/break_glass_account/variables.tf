variable "aad-tenant-id" {
  type    = string
  default = "308730fe-20c5-49fe-9ff4-3d2082479449"
}

variable "upn-bg1" {
  type    = string
  default = "breakglass.account.1@dlineyazuretraining.onmicrosoft.com"
}

variable "account-display-name-bg1" {
  type    = string
  default = "Emergency Access Account 1"
}

variable "account-password-bg1" {
  type    = string
  default = "AK*u#2z?@GSC7b/$Lq5T"
}

variable "security-group-display-name" {
  type    = string
  default = "sec_emergency_access"
}
