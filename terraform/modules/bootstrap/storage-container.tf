resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.storage_container}"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage_account.name}"
  container_access_type = "private"
}
