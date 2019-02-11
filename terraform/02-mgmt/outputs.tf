output "bastion_public_ip" {
  value = "${module.public_ip.public_ip_address}"
}
