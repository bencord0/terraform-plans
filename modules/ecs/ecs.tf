resource "aws_launch_configuration" "ecs" {
  name_prefix = "ecs-"

  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"

  security_groups = [
    "${aws_security_group.ecs.id}"
  ]

  key_name             = "${var.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs.name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs" {
  name_prefix = "ecs-"

  max_size = "${var.max_size}"
  min_size = "${var.min_size}"

  vpc_zone_identifier = ["${split(",", var.subnet_ids)}"]

  launch_configuration = "${aws_launch_configuration.ecs.name}"

  lifecycle {
    create_before_destroy = true
  }
}
