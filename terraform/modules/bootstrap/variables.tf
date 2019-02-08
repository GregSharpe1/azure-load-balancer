variable "resource_group_name" {
  description = "Enter the name of the resource group"
}

variable "resource_group_location" {
  description = "Enter the location for the resource group"
  default     = "East US"
}
variable "storage_account" {
  description = "Enter the name of the storage account"
  default     = "web-platform-storage-account"
}
variable "storage_container" {
  description = "Enter the name of the storage container"
  default     = "web-platform-storage-container"
}

variable "instance_tags" {
  type = "map"

  default {
    Name = "Web-Platform"
    Environment = "Development"
  }
}

variable "storage_replication_type" {
  description = "What storage type would you like to use? (RAGRS default)"
  default = "RAGRS"
}
