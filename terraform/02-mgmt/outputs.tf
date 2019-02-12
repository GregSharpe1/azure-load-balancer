output "bastion_public_ip" {
  value = "${module.public_ip.public_ip_address}" # Will report error when outputs is nil: https://github.com/hashicorp/terraform/issues/18197
}
