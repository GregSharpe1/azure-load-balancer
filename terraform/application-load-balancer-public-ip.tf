resource "azurerm_public_ip" "application_load_balancer_pubic_ip" {
  name                = "application-load-balancer-public-ip"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"
  allocation_method   = "Static"

  tags = "${merge(var.instance_tags)}"
}
