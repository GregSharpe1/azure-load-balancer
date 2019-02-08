resource "azurerm_virtual_network" "dog_application_virtual_network" {
  name                = "${var.virtual_network_name}"
  location            = "${var.virtual_network_location}"
  resource_group_name = "${var.resource_group_name}"

  address_space = "${var.virtual_network_address_space}"

  tags = "${merge(var.instance_tags)}"
}
