module "vpc" {
  source = "../../modules/vpc"
}

module "network" {
  source = "../../modules/network"

  azs = data.aws_availability_zones.azs.names

  vpc_id      = "${module.vpc.vpc_id}"
  vpc_cidr_v4 = "${module.vpc.vpc_cidr_v4}"
  vpc_cidr_v6 = "${module.vpc.vpc_cidr_v6}"
}
