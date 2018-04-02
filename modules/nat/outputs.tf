output "nat_ids" {
  value = "${join(",", aws_nat_gateway.nat.*.id)}"
}
