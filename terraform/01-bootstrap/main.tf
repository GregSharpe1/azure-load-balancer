module "bootstrap" {
  source                  = "../modules/bootstrap"
  resource_group_location = "${var.resource_group_location}"
  resource_group_name     = "Web-Platform-Storage-Account"
  storage_account         = "webapplicationsa"
}
