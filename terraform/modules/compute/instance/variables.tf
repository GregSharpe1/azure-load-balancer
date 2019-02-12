variable "instance_name" {
  description = "ID of the instance"
}

variable "resource_group_name" {
  description = "What is the resource group name?"
}

variable "resource_group_location" {
  description = "Where would you like the vNet to be?"
}

variable "network_interface_id" {
  description = "ID of the required network interface"
}

variable "availability_set_id" {
  description = "ID of the created availability set"
}

variable "os_profile_computer_name" {
  description = "OS profile name"
}

variable "os_profile_admin_username" {
  description = "OS Admin username"
}

variable "os_profile_ssh_key_data" {
  description = "SSH Key data"
}

variable "instance_tags" {
  type = "map"

  default {
    Name        = "Web-Platform"
    Environment = "Development"
  }
}

# Storage options (all defaulted)
variable "instance_vm_size" {
  description = "VM Size"
  default     = "Standard_DS1_v2"
}

variable "storage_caching_option" {
  description = "What caching option would you like?"
  default     = "ReadWrite"
}

variable "storage_creating_option" {
  description = "What creating option would you like?"
  default     = "Attach" # Issue when attempting to "move" a VM into an availability set. See: https://github.com/hashicorp/terraform/issues/14002
}

variable "storage_managed_disk_type" {
  description = "Managed disk storage type"
  default     = "Standard_LRS"
}
