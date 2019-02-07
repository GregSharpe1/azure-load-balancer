resource "azurerm_lb" "application_load_balancer" {
  name                = "application-load-balancer"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"

  frontend_ip_configuration {
    name                 = "application-load-balancer-public-ip"
    public_ip_address_id = "${azurerm_public_ip.application_load_balancer_pubic_ip.id}"
  }

  tags = "${merge(var.instance_tags)}"
}
