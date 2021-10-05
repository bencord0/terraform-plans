resource "aws_subnet" "private" {
  vpc_id = var.vpc_id

  count             = length(var.azs)
  availability_zone = element(var.azs, count.index)

  cidr_block      = cidrsubnet(var.cidr_v4, 4, count.index)
  ipv6_cidr_block = cidrsubnet(var.cidr_v6, 4, count.index)

  # This is what makes the subnet private
  map_public_ip_on_launch = false

  assign_ipv6_address_on_creation = true
}
