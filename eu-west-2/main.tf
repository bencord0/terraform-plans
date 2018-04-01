module "vpc" {
  source = "../modules/vpc"
}

module "network" {
  source = "../modules/network"

  azs    = "${lookup(var.azs, var.region)}"

  vpc_id      = "${module.vpc.vpc_id}"
  vpc_cidr_v4 = "${module.vpc.vpc_cidr_v4}"
  vpc_cidr_v6 = "${module.vpc.vpc_cidr_v6}"
}

module "identity" {
  source = "../modules/identity"

  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

module "bastion" {
  source = "../modules/bastion"

  enable_bastion = "${var.enable_bastion}"

  vpc_id        = "${module.vpc.vpc_id}"
  image_id      = "${lookup(var.coreos_amis, var.region)}"
  instance_type = "${var.bastion_instance_type}"

  key_name   = "${module.identity.key_name}"
  subnet_ids = "${module.network.public_subnet_ids}"
}
