variable "availability_set_name" {
  description = "Given name of the availability set"
}

variable "resource_group_name" {
  description = "What is the resource group name?"
}

variable "resource_group_location" {
  description = "Where would you like the vNet to be?"
}

variable "instance_tags" {
  type = "map"

  default {
    Name        = "Web-Platform"
    Environment = "Development"
  }
}
