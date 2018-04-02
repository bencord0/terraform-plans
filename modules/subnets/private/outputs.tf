output "subnet_ids" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "ipv4_cidrs" {
  value = "${join(",", aws_subnet.private.*.cidr_block)}"
}

output "ipv6_cidrs" {
  value = "${join(",", aws_subnet.private.*.ipv6_cidr_block)}"
}
