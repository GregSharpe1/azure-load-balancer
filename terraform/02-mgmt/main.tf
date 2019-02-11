# What needs to be in the MGMT section?

# vnet needs to be built - how do I pass the vnet info into the second application?
module "resource_group" {
  source = "../modules/general/resource-group"
  resource_group_name = "Website-Platform"
  resource_group_location = "East US"
}

module "virtual_network" {
  source = "../modules/networking/vnet"
  virtual_network_name = "Website-Platform"
  virtual_network_location = "${module.resource_group.resource_group_location}"
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

module "public_ip" {
  source = "../modules/networking/public-ip"
  public_ip_name = "bastion_public_ip"
  resource_group_name = "${module.resource_group.resource_group_name}"
  resource_group_location = "${module.resource_group.resource_group_location}"
}

module "network_interface" {
  source = "../modules/networking/network-interface-public-ip"
  network_interface_name = "bastion_network_interface"
  resource_group_name = "${module.resource_group.resource_group_name}"
  resource_group_location = "${module.resource_group.resource_group_location}"
  public_ip_id = "${module.public_ip.public_ip_id}"
  subnet_id = "${module.subnet.subnet_id}"
}

module "bastion_instance" {
  source = "../modules/compute/instance"
  instance_name = "bastion"
  resource_group_name = "${module.resource_group.resource_group_name}"
  resource_group_location = "${module.resource_group.resource_group_location}"
  network_interface_id = "${module.network_interface.network_interface_id}"
  os_profile_computer_name = "bastion-profile"
  os_profile_admin_username = "greg"
  os_profile_ssh_key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYmtUL1bwKmnVDBzzSZcmpWaNZSeXI8Sqk7xUVB86XAwss1a3QZobu1X9CXK5z1dCyQCJMyG6+5Ov2wb+lMhYvV3Ql0qHmxZ9sIdm4p2S0FtP0yzZ/Ia7ZoGrbIaVISrs8ivZnADv7Vqho595DxMLEn9CzQq/Cd0WVYd6e70y4DaXQF8ywSSvom6VuRF7oV9nHC4rszZMOz8nkV4aYXgUaeneQEdmrkcx4uzwlMZ2cfroTZOOM8mIYi7/fdUgd4TFJzmruW7gHaPz1wQPnywXE5rLGua6VUhCPmInX1zGahQ4aS4HdpIZZw2kWs7/S7yPB3jL5n6P6OgqU5lyu0gEf Azure Playground"
}
