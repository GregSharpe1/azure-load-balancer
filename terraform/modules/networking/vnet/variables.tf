variable "virtual_network_name" {
  description = "What would you like to call your vNet?"
}

variable "virtual_network_location" {
  description = "Where would you like the vNet to be?"
}

variable "resource_group_name" {
  description = "What is the resource group name?"
}

variable "virtual_network_address_space" {
  description = "Address space for the vNet? (10.0.0.0/16 by default)"
  default = ["10.0.0.0/16"]
}

variable "instance_tags" {
  type = "map"

  default {
    Name        = "Web-Platform"
    Environment = "Development"
  }
}
