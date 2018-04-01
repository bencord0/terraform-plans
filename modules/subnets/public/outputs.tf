output "subnet_ids" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "ipv4_cidrs" {
  value = "${join(",", aws_subnet.public.*.cidr_block)}"
}

output "ipv6_cidrs" {
  value = "${join(",", aws_subnet.public.*.ipv6_cidr_block)}"
}
