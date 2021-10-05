variable "vpc_id" {}

variable "azs" {
  type = list
}

variable "cidr_v4" {}
variable "cidr_v6" {}

variable "ipv4_nat_ids" {}
variable "ipv6_gateway_id" {}
