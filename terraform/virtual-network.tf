resource "azurerm_virtual_network" "dog_application_virtual_network" {
  name                = "dog-application-vnet"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"

  address_space = ["10.0.0.0/16"]

  tags = "${merge(var.instance_tags)}"
}
