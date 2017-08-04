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
