resource "aws_launch_configuration" "bastion" {
  name_prefix = "bastion-"

  image_id      = var.image_id
  instance_type = var.instance_type

  security_groups = [
    aws_security_group.bastion.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bastion" {
  name_prefix = "bastion-"

  min_size = 0
  max_size = var.enable_bastion

  vpc_zone_identifier = var.subnet_ids

  launch_configuration = aws_launch_configuration.bastion.name

  lifecycle {
    create_before_destroy = true
  }
}
