resource "consul_key_prefix" "03-ecs" {
  path_prefix = "${var.region}/03-ecs-outputs/"

  subkeys = {
    "cluster_id" = "${module.ecs.cluster_id}"
  }
}
