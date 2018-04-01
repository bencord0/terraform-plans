resource "aws_route_table" "private" {
  vpc_id = "${var.vpc_id}"

  # Need one route table per AZ, as each uses a separate NAT
  count = "${length(split(",", var.azs))}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.nat.*.id, count.index)}"
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = "${var.ipv6_gateway_id}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Attach each subnet to the route table
resource "aws_route_table_association" "private" {
  count     = "${length(split(",", var.azs))}"
  subnet_id = "${element(aws_subnet.private.*.id, count.index)}"

  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}
