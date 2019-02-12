resource "azurerm_virtual_machine" "virtual_machine" {
  name                  = "${var.instance_name}"
  location              = "${var.resource_group_location}"
  resource_group_name   = "${var.resource_group_name}"
  availability_set_id   = "${var.availability_set_id}"
  network_interface_ids = ["${var.network_interface_id}"]
  vm_size               = "${var.instance_vm_size}"

  storage_os_disk {
    name              = "${var.instance_name}-storage"
    caching           = "${var.storage_caching_option}"
    create_option     = "${var.storage_creating_option}"
    managed_disk_type = "${var.storage_managed_disk_type}"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.os_profile_computer_name}"
    admin_username = "${var.os_profile_admin_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.os_profile_admin_username}/.ssh/authorized_keys"
      key_data = "${var.os_profile_ssh_key_data}"
    }
  }

  tags = "${merge(var.instance_tags)}"
}
