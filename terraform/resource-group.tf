resource "azurerm_resource_group" "dog_application_resource_group" {
  name     = "dog-applcation-resource-group"
  location = "${var.location}"

  tags = "${merge(var.instance_tags)}"
}
