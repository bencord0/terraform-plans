module "ecs" {
  source = "../../modules/ecs"

  cluster_name = "default"
  max_size     = "${var.ecs_max_size}"
  min_size     = "${var.ecs_min_size}"

  vpc_id        = "${local.vpc_id}"
  image_id      = "${lookup(var.ecs_amis, var.region)}"
  instance_type = "${var.ecs_instance_type}"

  key_name   = "${local.key_name}"
  subnet_ids = "${local.private_subnet_ids}"

  bastion_security_group_id = "${local.bastion_security_group_id}"
}
