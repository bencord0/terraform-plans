output "public_subnet_ids" {
  value = "${module.public_subnets.subnet_ids}"
}

output "public_ipv4_cidrs" {
  value = "${module.public_subnets.ipv4_cidrs}"
}

output "public_ipv6_cidrs" {
  value = "${module.public_subnets.ipv6_cidrs}"
}

output "private_subnet_ids" {
  value = "${module.private_subnets.subnet_ids}"
}

output "private_ipv4_cidrs" {
  value = "${module.private_subnets.ipv4_cidrs}"
}

output "private_ipv6_cidrs" {
  value = "${module.private_subnets.ipv6_cidrs}"
}
