data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.image_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.cpucount
  memory   = var.memory
  guest_id = data.vsphere_virtual_machine.template.guest_id

  firmware = "bios"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }

  clone {
  template_uuid = data.vsphere_virtual_machine.template.id

  customize {
    linux_options {
      host_name = var.vm_name
      domain = "subwave.local"
    }

    network_interface {
      ipv4_address = var.ip_address
      ipv4_netmask = var.ip_netmask
      
    }
    dns_server_list = var.dns_servers
    ipv4_gateway = var.ip_gateway
  }
}
}
