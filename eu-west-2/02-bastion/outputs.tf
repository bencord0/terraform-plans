resource "consul_key_prefix" "bastion" {
  path_prefix = "${var.region}/02-bastion-outputs/"

  subkeys = {
    "security_group_id" = module.bastion.security_group_id
  }
}
