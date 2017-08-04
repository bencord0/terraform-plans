provider "aws" {
  region = "eu-west-2"
}

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

# An internal subnet for EC2 instances
resource "aws_subnet" "default" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}
