variable "resource_group_name" {
  description = "What is the resource group name?"
}

variable "resource_group_location" {
  description = "Location of the resource group"
}


variable "instance_tags" {
  type = "map"

  default {
    Name = "Web-Platform"
    Environment = "Development"
  }
}
