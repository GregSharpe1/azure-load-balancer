resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account}"
  resource_group_name      = "${azurerm_resource_group.resource_group.name}"
  location                 = "${var.resource_group_location}"
  account_tier             = "Standard"
  account_replication_type = "${var.storage_replication_type}"
  account_kind             = "StorageV2"
  access_tier              = "hot"

  tags = "${merge(var.instance_tags)}"
}
