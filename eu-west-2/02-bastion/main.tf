module "bastion" {
  source = "../../modules/bastion"

  enable_bastion = var.enable_bastion

  vpc_id        = local.vpc_id
  image_id      = lookup(var.debian_amis, var.region)
  instance_type = var.bastion_instance_type

  subnet_ids = local.public_subnet_ids
}
