resource "consul_key_prefix" "ecs" {
  path_prefix = "${var.region}/03-ecs-outputs/"

  subkeys = {
    "cluster_id" = module.ecs.cluster_id
  }
}
