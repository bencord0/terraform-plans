data "aws_iam_policy_document" "assume_ecs" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
        "ecs.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "ecs" {
  statement {
    actions = [
      "ecs:DeregisterContainerInstance",
      "ecs:DiscoverPollEndpoint",
      "ecs:Poll",
      "ecs:RegisterContainerInstance",
      "ecs:StartTelemetrySession",
      "ecs:Submit*",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role" "ecs" {
  name = "ecs"
  assume_role_policy = "${data.aws_iam_policy_document.assume_ecs.json}"
}

resource "aws_iam_role_policy" "ecs" {
  name = "ecs"
  policy = "${data.aws_iam_policy_document.ecs.json}"
  role = "${aws_iam_role.ecs.id}"
}

resource "aws_iam_instance_profile" "ecs" {
  name = "ecs"
  path = "/"
  role = "${aws_iam_role.ecs.name}"
}

resource "aws_autoscaling_group" "ecs" {
  name = "ecs"

  launch_configuration = "${aws_launch_configuration.ecs.name}"
  vpc_zone_identifier = [
    "${aws_subnet.default.*.id}"
  ]

  max_size = "${var.instance_max}"
  min_size = "${var.instance_min}"
}

resource "aws_launch_configuration" "ecs" {
  name_prefix = "ecs-"
  instance_type = "t2.nano"
  image_id = "${lookup(var.ecs_amis, var.region)}"

  key_name = "${aws_key_pair.auth.id}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs.name}"

  security_groups = [
    "${aws_security_group.bastion.id}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_cluster" "default" {
  name = "default"
}

resource "aws_ecr_repository" "image" {
  name = "image"
}

resource "aws_ecs_task_definition" "nginx" {
  family = "nginx"
  container_definitions = "${file("task_definitions/nginx.json")}"

  network_mode = "awsvpc"
}

resource "aws_ecs_service" "nginx" {
  name = "nginx"
  task_definition = "${aws_ecs_task_definition.nginx.arn}"
  desired_count = 1

  cluster = "${aws_ecs_cluster.default.id}"

  deployment_maximum_percent = 100
  deployment_minimum_healthy_percent = 0

  network_configuration = {
    subnets = [
      "${aws_subnet.default.*.id}"
    ]

    security_groups = [
      "${aws_security_group.web.id}"
    ]
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.web.arn}"
    container_name = "nginx"
    container_port = 80
  }

}
