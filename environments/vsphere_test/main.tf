module "fake_co_dns_vm1" {
  #Module Source
  source = "../../modules/vsphere_win22_std"

  #Machine Variables
  vm_name = "fake-co-dns-1"
  cpucount = 2
  memory = 2048

  #IP Addressing
  ip_address = "192.168.1.98"
  ip_netmask = 24
  dns_servers = ["192.168.1.2", "192.168.1.254"]
}

module "fake_co_dns_vm2" {
  #Module Source
  source = "../../modules/vsphere_win22_std"

  #Machine Variables
  vm_name = "fake-co-dns-2"
  cpucount = 2
  memory = 2048

  #IP Addressing
  ip_address = "192.168.1.95"
  ip_netmask = 24
  dns_servers = ["192.168.1.2", "192.168.1.254"]
}

module "fake_co_dns_vm3" {
  #Module Source
  source = "../../modules/vsphere_ubuntu22"

  #Machine Variables
  vm_name = "fake-co-dns-3"
  cpucount = 2
  memory = 2048

  #IP Addressing
  ip_address = "192.168.1.97"
  ip_netmask = 24
  dns_servers = ["192.168.1.2", "192.168.1.254"]
}