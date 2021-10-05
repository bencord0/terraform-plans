resource "aws_ecs_task_definition" "nginx" {
  family = "nginx"
  container_definitions = file("${path.module}/task_definitions/nginx.json")

  cpu          = "256"
  memory       = "512"
  network_mode = "awsvpc"

  requires_compatibilities = ["EC2", "FARGATE"]
}

resource "aws_ecs_service" "nginx" {
  name = "nginx"
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count = 1

  cluster = var.ecs_cluster_id
  launch_type = "FARGATE"

  deployment_maximum_percent = 200
  deployment_minimum_healthy_percent = 50

  network_configuration {
    subnets = var.public_subnet_ids

    security_groups = [
      aws_security_group.web.id,
    ]

    assign_public_ip = true
  }

  #load_balancer {
  #  target_group_arn = "${aws_alb_target_group.web.arn}"
  #  container_name = "nginx"
  #  container_port = 80
  #}

  lifecycle {
    ignore_changes = [desired_count]
  }
}
