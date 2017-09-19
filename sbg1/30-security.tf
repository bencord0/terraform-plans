resource "openstack_networking_secgroup_v2" "web" {
  name = "web"
  description = "Allow HTTP/HTTPS traffic"
}

resource "openstack_networking_secgroup_rule_v2" "httpv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 80
  port_range_max = 80
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "httpsv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 443
  port_range_max = 443
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web.id}"
}

resource "openstack_networking_secgroup_v2" "ssh" {
  name = "ssh"
  description = "Allow SSH traffic"
}

resource "openstack_networking_secgroup_rule_v2" "sshv4" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.ssh.id}"
}

