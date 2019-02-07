output "bastion_pulic_ip_address" {
  value = "${azurerm_public_ip.bastion_public_ip.ip_address}"
}

output "bastion_private_ip_address" {
  value = "${azurerm_network_interface.bastion_network_interface.private_ip_address}"
}

output "application_private_ips" {
  value = "${join(",", azurerm_network_interface.application_virtual_machine_network_interface.*.private_ip_address)}"
}

output "application_load_balancer_public_ip" {
  value = "${azurerm_public_ip.application_load_balancer_pubic_ip.ip_address}"
}
