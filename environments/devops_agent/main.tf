module "devops_linux_01" {
  #Module Source
  source = "../../modules/vsphere_ubuntu22"

  #Machine Variables
  vm_name = "p-sbwv-devops-01"
  cpucount = 2
  memory = 2048

  #IP Addressing
  ip_address = "192.168.1.90"
  ip_netmask = 24
  dns_servers = ["192.168.1.2", "192.168.1.254"]
}