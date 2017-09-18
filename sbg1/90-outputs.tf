output "bastion" {
  value = "${openstack_compute_instance_v2.bastion.access_ip_v4}"
}

output "kube1" {
  value = "${openstack_compute_instance_v2.kube1.access_ip_v4}"
}
