# Only need one NAT per AZ
# multiple private subnets may use the NAT within an AZ

resource "aws_eip" "nat" {
  # Terraform cannot use a computed variable for count.
  # Use var.azs instead of var.public_subnet_ids.
  count = "${length(split(",", var.azs))}"

  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  count = "${length(split(",", var.azs))}"

  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(split(",", var.public_subnet_ids), count.index)}"
}
