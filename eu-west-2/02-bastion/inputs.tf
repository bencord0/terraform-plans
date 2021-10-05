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

locals {
  vpc_id            = data.consul_keys.vpc.var.vpc_id
  public_subnet_ids = split(",", data.consul_keys.vpc.var.public_subnet_ids)
}
