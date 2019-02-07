# Only allow port 22 from the office IP to the Bastion Public IP
resource "azurerm_network_security_rule" "mgmt_security_rule" {
  name                        = "mgmt-security-rule"
  priority                    = 220
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = 22
  destination_port_range      = 22
  source_address_prefix       = "185.38.247.178/32"                                             # TODO: Only allowed traffic from a specific IP (Office IP)
  destination_address_prefix  = "${azurerm_public_ip.bastion_public_ip.ip_address}"             # TODO: Add configuration to point to everything within a subnet
  resource_group_name         = "${azurerm_resource_group.dog_application_resource_group.name}"
  network_security_group_name = "${azurerm_network_security_group.mgmt_security_group.name}"
}
