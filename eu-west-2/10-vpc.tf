# Everything starts with a VPC
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

# Grant the VPC internet access (NAT)
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}
resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}


# A bastion in the default security group
resource "aws_instance" "bastion" {
  instance_type = "t2.nano"
  ami = "${lookup(var.aws_amis, "eu-west-2")}"

  key_name = "${aws_key_pair.auth.id}"
  subnet_id = "${aws_subnet.default.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
}
