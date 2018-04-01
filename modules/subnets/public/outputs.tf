output "subnet_ids" {
  value = "${aws_subnet.public.*.id}"
}

output "ipv4_cidrs" {
  value = "${aws_subnet.public.*.cidr_block}"
}

output "ipv6_cidrs" {
  value = "${aws_subnet.public.*.ipv6_cidr_block}"
}
