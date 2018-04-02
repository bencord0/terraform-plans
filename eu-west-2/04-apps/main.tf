module "apps" {
  source = "../../modules/apps"

  vpc_id         = "${local.vpc_id}"
  ecs_cluster_id = "${local.ecs_cluster_id}"

  public_subnet_ids  = "${local.public_subnet_ids}"
  private_subnet_ids = "${local.private_subnet_ids}"
}
