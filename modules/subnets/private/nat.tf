# Only need one NAT per AZ
# multiple private subnets may use the NAT within an AZ
resource "aws_eip" "nat" {
  count = "${length(split(",", var.azs))}"

  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  count = "${length(split(",", var.azs))}"

  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.private.*.id, count.index)}"
}
