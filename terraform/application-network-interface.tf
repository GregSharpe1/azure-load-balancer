resource "azurerm_network_interface" "application_virtual_machine_network_interface" {
  count               = 2
  name                = "application-network-interface0${count.index + 1}"
  location            = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"

  ip_configuration {
    name                                    = "application-network-interface0${count.index + 1}-ip-configuration"
    subnet_id                               = "${azurerm_subnet.application_subnet.id}"
    private_ip_address_allocation           = "dynamic"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "lb-be" {
    count                   = 2
    network_interface_id    = "${element(azurerm_network_interface.application_virtual_machine_network_interface.*.id, count.index)}"
    ip_configuration_name   = "application-network-interface0${count.index + 1}-ip-configuration"
    backend_address_pool_id = "${azurerm_lb_backend_address_pool.application_load_balancer_backend_pool.id}"
}
