variable "datacenter" {
  default = "Datacenter"
  description = "Default datacenter used"
}

variable "cluster" {
  default = "cluster1"
  description = "Default cluster used to deploy machines to. Cluster must be matched to Datacenter"
}

variable "datastore" {
  default = "Disk3_Crucial_SSD_Old"
  description = "Default datastore used to store machines Datastore must be matched to Datacenter"
}

variable "network" {
  default = "VM Network"
  description = "Default network. Network must be matched to Datacenter"
}

variable "image_template" {
  default = "windows2022-template"
  description = "Default windows image"
}

variable "vm_name" {
  default = "tut-change-the-name"
  description = "Default vm name"
}

variable "cpucount" {
  type = number
  default = 1
  description = "CPU core count allocated to the machine"
}

variable "memory" {
  type = number
  default = 1024
  description = "Memory allocated to the machine. 1 equals 1GB, 2 equals 2GB..."
}

variable "ip_address" {
  default = "192.168.1.98"
}

variable "ip_netmask" {
  type = number
  default = 24
}

variable "ip_gateway" {
  default = "192.168.1.254"
}

variable "dns_servers" {
  type = list(string)
  default = [
    "192.168.1.2",
    "192.168.1.254"
  ]
}
