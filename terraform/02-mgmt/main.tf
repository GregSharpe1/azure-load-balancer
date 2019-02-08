# What needs to be in the MGMT section?

# vnet needs to be built - how do I pass the vnet info into the second application?
module "resource_group" {
  source = "../modules/general/resource-group"
  resource_group_name = "${var.resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
}

module "virtual_network" {
  source = "../modules/networking/vnet"
  virtual_network_name = "${var.virtual_network_name}"
  virtual_network_location = "${var.resource_group_location}"
  resource_group_name = "${module.resource_group.resource_group_name}"
  virtual_network_address_space = ["10.0.0.0/16"]
}

module "subnet" {
  source = "../modules/networking/subnet"
  subnet_name = "mgmt_subnet"
  resource_group_name = "${module.resource_group.resource_group_name}"
  virtual_network_name = "${module.virtual_network.virtual_network_name}"
  subnet_network_address_space = "10.0.1.0/24"
}
