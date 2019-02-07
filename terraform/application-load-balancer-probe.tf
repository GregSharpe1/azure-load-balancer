resource "azurerm_lb_probe" "application_load_balancer_probe_http" {
  name                = "application-loadbalancer-port-80-probe"
  resource_group_name = "${azurerm_resource_group.dog_application_resource_group.name}"
  loadbalancer_id     = "${azurerm_lb.application_load_balancer.id}"
  protocol            = "tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}
