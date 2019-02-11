variable "network_interface_name" {
  description = "Network Interface name"
}

variable "resource_group_name" {
  description = "What is the resource group name?"
}

variable "resource_group_location" {
  description = "Where would you like the vNet to be?"
}

variable "public_ip_id" {
  description = "Public IP address id"
}


variable "subnet_id" {
  description = "Subnet ID"
}

variable "instance_tags" {
  type = "map"

  default {
    Name        = "Web-Platform"
    Environment = "Development"
  }
}
