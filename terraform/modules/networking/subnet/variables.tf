variable "resource_group_name" {
  description = "What is the resource group name?"
}

variable "virtual_network_name" {
  description = "What's the virtual network name?"
}

variable "subnet_network_address_space" {
  description = "Address space for the vNet? (10.0.1.0/24 by default)"
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "Subnet name?"
}
