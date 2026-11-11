resource "libvirt_pool" "terraform_lab" {
  name = "terraform-lab"
  type = "dir"
  path = "/var/lib/libvirt/images/terraform-lab"
}

resource "libvirt_volume" "iosv_base" {
  name   = "iosv-base.qcow2"
  pool   = libvirt_pool.terraform_lab.name
  source = "/var/lib/libvirt/images/terraform-lab/iosv.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "iosvl2_base" {
  name   = "iosvl2-base.qcow2"
  pool   = libvirt_pool.terraform_lab.name
  source = "/var/lib/libvirt/images/terraform-lab/iosvl2.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "r1_disk" {
  name           = "r1-disk.qcow2"
  pool           = libvirt_pool.terraform_lab.name
  base_volume_id = libvirt_volume.iosv_base.id
  format         = "qcow2"
}

resource "libvirt_volume" "r2_disk" {
  name           = "r2-disk.qcow2"
  pool           = libvirt_pool.terraform_lab.name
  base_volume_id = libvirt_volume.iosv_base.id
  format         = "qcow2"
}

resource "libvirt_volume" "sw1_disk" {
  name           = "sw1-disk.qcow2"
  pool           = libvirt_pool.terraform_lab.name
  base_volume_id = libvirt_volume.iosvl2_base.id
  format         = "qcow2"
}

resource "libvirt_network" "mgmt_network" {
  name      = "mgmt-network"
  mode      = "nat"
  autostart = true
  addresses = ["192.168.100.0/24"]
}

resource "libvirt_network" "lab_network" {
  name      = "lab-network"
  mode      = "none"
  autostart = true
}

resource "libvirt_domain" "r1" {
  name   = "R1-Terraform"
  memory = 512
  vcpu   = 1

  disk {
    volume_id = libvirt_volume.r1_disk.id
  }

  network_interface {
    network_id = libvirt_network.mgmt_network.id
  }

  network_interface {
    network_id = libvirt_network.lab_network.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  autostart = false
}

resource "libvirt_domain" "r2" {
  name   = "R2-Terraform"
  memory = 512
  vcpu   = 1

  disk {
    volume_id = libvirt_volume.r2_disk.id
  }

  network_interface {
    network_id = libvirt_network.mgmt_network.id
  }

  network_interface {
    network_id = libvirt_network.lab_network.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  autostart = false
}

resource "libvirt_domain" "sw1" {
  name   = "SW1-Terraform"
  memory = 512
  vcpu   = 1

  disk {
    volume_id = libvirt_volume.sw1_disk.id
  }

  network_interface {
    network_id = libvirt_network.mgmt_network.id
  }

  network_interface {
    network_id = libvirt_network.lab_network.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  autostart = false
}
# Image base Fortinet
resource "libvirt_volume" "fortinet_base" {
  name   = "fortinet-base.qcow2"
  pool   = libvirt_pool.terraform_lab.name
  source = "/var/lib/libvirt/images/terraform-lab/fortinet.qcow2"
  format = "qcow2"
}

# Disk Fortinet
resource "libvirt_volume" "fortinet_disk" {
  name           = "fortinet-disk.qcow2"
  pool           = libvirt_pool.terraform_lab.name
  base_volume_id = libvirt_volume.fortinet_base.id
  format         = "qcow2"
}

# Fortinet Firewall
resource "libvirt_domain" "fortinet" {
  name   = "Fortinet-Terraform"
  memory = 1024
  vcpu   = 1

  disk {
    volume_id = libvirt_volume.fortinet_disk.id
  }

  network_interface {
    network_id = libvirt_network.mgmt_network.id
  }

  network_interface {
    network_id = libvirt_network.lab_network.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  autostart = false
}
