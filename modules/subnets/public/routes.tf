resource "aws_route_table" "public" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.ipv4_gateway_id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${var.ipv6_gateway_id}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Attach each subnet to the route table
resource "aws_route_table_association" "public" {
  count     = "${length(split(",", var.azs))}"
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"

  route_table_id = "${aws_route_table.public.id}"

  lifecycle {
    create_before_destroy = true
  }
}
