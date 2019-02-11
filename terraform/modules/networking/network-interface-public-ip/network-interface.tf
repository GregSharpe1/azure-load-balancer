resource "azurerm_network_interface" "network_interface" {
  name                = "${var.network_interface_name}"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                          = "${var.network_interface_name}_config"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${var.public_ip_id}"
  }
}
