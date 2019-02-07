resource "azurerm_subnet" "application_subnet" {
  name                 = "application-subnet"
  resource_group_name  = "${azurerm_resource_group.dog_application_resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.dog_application_virtual_network.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet_network_security_group_association" "mgmt_to_application_subnet_nsg" {
  subnet_id                 = "${azurerm_subnet.application_subnet.id}"
  network_security_group_id = "${azurerm_network_security_group.mgmt_to_application_security_group.id}"
}
