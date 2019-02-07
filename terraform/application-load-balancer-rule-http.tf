resource "azurerm_lb_rule" "application_load_balancer_rule_http" {
  resource_group_name            = "${azurerm_resource_group.dog_application_resource_group.name}"
  loadbalancer_id                = "${azurerm_lb.application_load_balancer.id}"
  name                           = "application-load-balancer-rule-http"
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "application-load-balancer-public-ip"
  enable_floating_ip             = false
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.application_load_balancer_backend_pool.id}"
  idle_timeout_in_minutes        = 5
  probe_id                       = "${azurerm_lb_probe.application_load_balancer_probe_http.id}"
  depends_on                     = ["azurerm_lb_probe.application_load_balancer_probe_http"]
}
