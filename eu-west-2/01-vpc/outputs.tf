resource "consul_key_prefix" "vpc" {
  path_prefix = "${var.region}/01-vpc-outputs/"

  subkeys = {
    "vpc_id" = module.vpc.vpc_id

    "public_subnet_ids"  = module.network.public_subnet_ids
    "private_subnet_ids" = module.network.private_subnet_ids
  }
}
