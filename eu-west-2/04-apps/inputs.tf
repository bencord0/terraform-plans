data "consul_keys" "01-vpc" {
  key {
    name = "vpc_id"
    path = "${var.region}/01-vpc-outputs/vpc_id"
  }

  key {
    name = "key_name"
    path = "${var.region}/01-vpc-outputs/key_name"
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

data "consul_keys" "02-bastion" {
  key {
    name = "bastion_security_group_id"
    path = "${var.region}/02-bastion-outputs/security_group_id"
  }
}

data "consul_keys" "03-ecs" {
  key {
    name = "cluster_id"
    path = "${var.region}/03-ecs-outputs/cluster_id"
  }
}

locals {
  vpc_id                    = "${data.consul_keys.01-vpc.var.vpc_id}"
  key_name                  = "${data.consul_keys.01-vpc.var.key_name}"
  public_subnet_ids         = "${data.consul_keys.01-vpc.var.public_subnet_ids}"
  private_subnet_ids        = "${data.consul_keys.01-vpc.var.private_subnet_ids}"
  bastion_security_group_id = "${data.consul_keys.02-bastion.var.bastion_security_group_id}"
  ecs_cluster_id            = "${data.consul_keys.03-ecs.var.cluster_id}"
}
