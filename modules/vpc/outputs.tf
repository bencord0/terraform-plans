output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "vpc_cidr_v4" {
  value = "${aws_vpc.default.cidr_block}"
}

output "vpc_cidr_v6" {
  value = "${aws_vpc.default.ipv6_cidr_block}"
}
