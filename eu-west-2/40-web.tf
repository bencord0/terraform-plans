# EC2 Instances
resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami = "${lookup(var.aws_amis, "eu-west-2")}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  subnet_id = "${aws_subnet.default.id}"

  user_data = "${file("userdata.sh")}"

  key_name = "${aws_key_pair.auth.id}"

  count = "${var.web_instance_count}"
}
