# EC2 Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  max_size = "${var.web_instance_max}"
  min_size = "${var.web_instance_min}"
  desired_capacity = "${var.web_instance_count}"
  launch_configuration = "${aws_launch_configuration.web_lc.name}"

  load_balancers = ["${aws_elb.web.name}"]
  vpc_zone_identifier = ["${aws_subnet.default.id}"]
}

# EC2 Launch Configuration
resource "aws_launch_configuration" "web_lc" {
  instance_type = "t2.nano"
  image_id = "${lookup(var.aws_amis, "eu-west-2")}"

  security_groups = ["${aws_security_group.default.id}"]

  user_data = "${file("userdata.sh")}"

  key_name = "${aws_key_pair.auth.id}"
}
