output "security_group_id" {
  value = "${aws_security_group.bastion.id}"
}

output "security_group_arn" {
  value = "${aws_security_group.bastion.arn}"
}
