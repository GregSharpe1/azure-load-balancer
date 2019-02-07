resource "azurerm_network_interface" "bastion_network_interface" {
  name                = "bastion-network-interface"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"

  ip_configuration {
    name                          = "bastion_ip_config"
    subnet_id                     = "${azurerm_subnet.mgmt_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.bastion_public_ip.id}"
  }
}
