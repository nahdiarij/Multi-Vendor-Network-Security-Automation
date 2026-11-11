output "r1_name" {
  value = libvirt_domain.r1.name
}

output "r2_name" {
  value = libvirt_domain.r2.name
}

output "sw1_name" {
  value = libvirt_domain.sw1.name
}

output "mgmt_network_name" {
  value = libvirt_network.mgmt_network.name
}

output "fortinet_name" {
  value = libvirt_domain.fortinet.name
}
