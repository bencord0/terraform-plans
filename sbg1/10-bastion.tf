resource "openstack_compute_instance_v2" "bastion" {
  name = "bastion"

  image_id = "dc0aa44a-d86d-475a-bf24-8fb0ace14059"  # Gentoo systemd (20161203)
  flavor_id = "164fcc7e-7771-414f-a607-b388cb7b7aa0"  # vps-ssd-1
  key_pair = "parsley"

  count = 1
}
