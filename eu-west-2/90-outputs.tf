output "address" {
  value = "${aws_elb.web.dns_name}"
}

output "bastion" {
  value = "${aws_instance.bastion.public_ip}"
}
