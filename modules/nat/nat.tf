# Only need one NAT per AZ
# multiple private subnets may use the NAT within an AZ

resource "aws_eip" "nat" {
  count = "${length(split(",", var.public_subnet_ids))}"

  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  count = "${length(split(",", var.public_subnet_ids))}"

  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(split(",", var.public_subnet_ids), count.index)}"
}
