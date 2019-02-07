resource "azurerm_subnet" "mgmt_subnet" {
  name                 = "mgmt-subnet"
  resource_group_name  = "${azurerm_resource_group.dog_application_resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.dog_application_virtual_network.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet_network_security_group_association" "mgmt_subnet_nsg" {
  subnet_id                 = "${azurerm_subnet.mgmt_subnet.id}"
  network_security_group_id = "${azurerm_network_security_group.mgmt_security_group.id}"
}
