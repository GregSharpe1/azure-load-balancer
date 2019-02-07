resource "azurerm_public_ip" "bastion_public_ip" {
  name                = "loadbalancer-example-lb-public-ip"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"
  allocation_method   = "Static"

  tags = "${merge(var.instance_tags)}"
}
