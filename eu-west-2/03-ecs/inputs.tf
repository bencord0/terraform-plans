data "consul_keys" "vpc" {
  key {
    name = "vpc_id"
    path = "${var.region}/01-vpc-outputs/vpc_id"
  }

  key {
    name = "private_subnet_ids"
    path = "${var.region}/01-vpc-outputs/private_subnet_ids"
  }

  key {
    name = "public_subnet_ids"
    path = "${var.region}/01-vpc-outputs/public_subnet_ids"
  }
}

data "consul_keys" "bastion" {
  key {
    name = "bastion_security_group_id"
    path = "${var.region}/02-bastion-outputs/security_group_id"
  }
}

locals {
  vpc_id                    = data.consul_keys.vpc.var.vpc_id
  private_subnet_ids        = split(",", data.consul_keys.vpc.var.private_subnet_ids)
  bastion_security_group_id = data.consul_keys.bastion.var.bastion_security_group_id
}
