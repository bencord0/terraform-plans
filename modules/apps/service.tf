resource "aws_ecs_task_definition" "nginx" {
  family = "nginx"
  container_definitions = "${file("${path.module}/task_definitions/nginx.json")}"

  network_mode = "awsvpc"
}

resource "aws_ecs_service" "nginx" {
  name = "nginx"
  task_definition = "${aws_ecs_task_definition.nginx.arn}"
  desired_count = 1

  cluster = "${var.ecs_cluster_id}"

  deployment_maximum_percent = 200
  deployment_minimum_healthy_percent = 50

  network_configuration = {
    subnets = [
      "${split(",", var.private_subnet_ids)}"
    ]

    security_groups = [
      "${aws_security_group.web.id}"
    ]
  }

  #load_balancer {
  #  target_group_arn = "${aws_alb_target_group.web.arn}"
  #  container_name = "nginx"
  #  container_port = 80
  #}

}
