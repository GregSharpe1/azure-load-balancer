resource "azurerm_network_security_rule" "mgmt_to_application_security_rule" {
  count                        = 2
  name                         = "mgmt-to-application-security-rule"
  priority                     = 100
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = 22
  destination_port_range       = 22
  source_address_prefix        = "${azurerm_network_interface.bastion_network_interface.private_ip_address}"
  destination_address_prefixes = ["${element(azurerm_network_interface.application_virtual_machine_network_interface.*.private_ip_address, count.index)}"]
  resource_group_name          = "${azurerm_resource_group.dog_application_resource_group.name}"
  network_security_group_name  = "${azurerm_network_security_group.mgmt_to_application_security_group.name}"
}

resource "azurerm_network_security_rule" "loadbalancer_to_application_security_rule" {
  name                        = "loadbalancer-to-application-security-rule"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = 80
  destination_port_range      = 80
  source_address_prefix       = "${azurerm_public_ip.application_load_balancer_pubic_ip.ip_address}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.dog_application_resource_group.name}"
  network_security_group_name = "${azurerm_network_security_group.mgmt_to_application_security_group.name}"
}
