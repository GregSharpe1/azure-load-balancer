resource "azurerm_lb_backend_address_pool" "application_load_balancer_backend_pool" {
  name                = "application-load-balancer-backend-pool"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"
  loadbalancer_id     = "${azurerm_lb.application_load_balancer.id}"
}
