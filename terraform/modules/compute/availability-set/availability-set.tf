resource "azurerm_availability_set" "availability_set" {
  name                = "${var.availability_set_name}"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"
  managed             = true

  tags = "${merge(var.instance_tags)}"
}
