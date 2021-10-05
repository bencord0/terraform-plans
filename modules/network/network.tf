# Grant the VPC internet access (NAT)
# There is one internet gateway for the VPC
resource "aws_internet_gateway" "default" {
  vpc_id = var.vpc_id
}

# Grant IPv6 traffic NAT-less internet access
resource "aws_egress_only_internet_gateway" "default" {
  vpc_id = var.vpc_id
}

module "public_subnets" {
  source = "../subnets/public"

  vpc_id = var.vpc_id
  azs    = var.azs

  cidr_v4 = cidrsubnet(var.vpc_cidr_v4, 4, 0)
  cidr_v6 = cidrsubnet(var.vpc_cidr_v6, 4, 0)

  ipv4_gateway_id = aws_internet_gateway.default.id
  ipv6_gateway_id = aws_internet_gateway.default.id
}

module "nat" {
  source = "../nat"

  azs               = var.azs
  public_subnet_ids = module.public_subnets.subnet_ids
}

module "private_subnets" {
  source = "../subnets/private"

  vpc_id = var.vpc_id
  azs    = var.azs

  cidr_v4 = cidrsubnet(var.vpc_cidr_v4, 4, 1)
  cidr_v6 = cidrsubnet(var.vpc_cidr_v6, 4, 1)

  ipv4_nat_ids    = module.nat.nat_ids
  ipv6_gateway_id = aws_egress_only_internet_gateway.default.id
}
