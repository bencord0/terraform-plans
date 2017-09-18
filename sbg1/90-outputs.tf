output "bastion" {
  value = "${openstack_compute_instance_v2.bastion.access_ip_v4}"
}
