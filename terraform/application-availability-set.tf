resource "azurerm_availability_set" "application_availability_set" {
  name                = "application-availability-set"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"
  managed             = true

  tags = "${merge(var.instance_tags)}"
}
