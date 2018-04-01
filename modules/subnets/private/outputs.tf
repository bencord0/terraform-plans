output "subnet_ids" {
  value = "${aws_subnet.private.*.id}"
}

output "ipv4_cidrs" {
  value = "${aws_subnet.private.*.cidr_block}"
}

output "ipv6_cidrs" {
  value = "${aws_subnet.private.*.ipv6_cidr_block}"
}
