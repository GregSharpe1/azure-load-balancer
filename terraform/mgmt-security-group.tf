resource "azurerm_network_security_group" "mgmt_security_group" {
  name                = "mgmt-security-group"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"
}
