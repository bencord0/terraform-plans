# EC2 Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  max_size = "${var.web_instance_max}"
  min_size = "${var.web_instance_min}"
  launch_configuration = "${aws_launch_configuration.web_lc.name}"

  health_check_type = "ELB"
  load_balancers = ["${aws_elb.web.name}"]
  vpc_zone_identifier = ["${aws_subnet.default.id}"]
}

# EC2 Launch Configuration
resource "aws_launch_configuration" "web_lc" {
  instance_type = "t2.nano"
  image_id = "${lookup(var.aws_amis, "eu-west-2")}"

  security_groups = ["${aws_security_group.elb.id}"]
  associate_public_ip_address = false

  user_data = "${file("userdata.sh")}"

  key_name = "${aws_key_pair.auth.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "web_asp_up" {
  name = "web_scale_up"

  autoscaling_group_name = "${aws_autoscaling_group.web_asg.name}"
  adjustment_type = "ChangeInCapacity"

  policy_type = "SimpleScaling"
  scaling_adjustment = 1
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_high" {
  alarm_name = "web_cpu_high"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUCreditBalance"
  namespace = "AWS/EC2"
  statistic = "Average"
  period = "300"
  threshold = "10"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.web_asg.name}"
  }

  alarm_actions = ["${aws_autoscaling_policy.web_asp_up.arn}"]
}

resource "aws_autoscaling_policy" "web_asp_down" {
  name = "web_scale_down"

  autoscaling_group_name = "${aws_autoscaling_group.web_asg.name}"
  adjustment_type = "ChangeInCapacity"

  policy_type = "SimpleScaling"
  scaling_adjustment = -1

}

resource "aws_cloudwatch_metric_alarm" "web_cpu_low" {
  alarm_name = "web_cpu_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "CPUCreditUsage"
  namespace = "AWS/EC2"
  statistic = "Average"
  period = "300"
  threshold = "1"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.web_asg.name}"
  }

  alarm_actions = ["${aws_autoscaling_policy.web_asp_down.arn}"]
}
