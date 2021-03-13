output "blog" {
  value = openstack_compute_instance_v2.blog.*.access_ip_v4
}
