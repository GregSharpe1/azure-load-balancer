resource "azurerm_virtual_machine" "bastion_virtual_machine" {
  name                  = "bastion01"
  location              = "${azurerm_resource_group.dog_application_resource_group.location}"
  resource_group_name   = "${azurerm_resource_group.dog_application_resource_group.name}"
  network_interface_ids = ["${azurerm_network_interface.bastion_network_interface.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "bastion-storage"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "azuretestprofile"
    admin_username = "greg"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/greg/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYmtUL1bwKmnVDBzzSZcmpWaNZSeXI8Sqk7xUVB86XAwss1a3QZobu1X9CXK5z1dCyQCJMyG6+5Ov2wb+lMhYvV3Ql0qHmxZ9sIdm4p2S0FtP0yzZ/Ia7ZoGrbIaVISrs8ivZnADv7Vqho595DxMLEn9CzQq/Cd0WVYd6e70y4DaXQF8ywSSvom6VuRF7oV9nHC4rszZMOz8nkV4aYXgUaeneQEdmrkcx4uzwlMZ2cfroTZOOM8mIYi7/fdUgd4TFJzmruW7gHaPz1wQPnywXE5rLGua6VUhCPmInX1zGahQ4aS4HdpIZZw2kWs7/S7yPB3jL5n6P6OgqU5lyu0gEf Azure Playground"
    }
  }

  tags = "${merge(var.instance_tags)}"
}
