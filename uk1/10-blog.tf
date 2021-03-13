resource "openstack_compute_instance_v2" "blog" {
  count = 1
  name = "blog"

  image_id = "06b6796b-61f5-4215-b658-f7f6d0bfa17b"  # Gentoo systemd (20210221)
  flavor_id = "e9d6fb38-9bf0-44ac-adbf-30fee3c96096"  # s1-2
  key_pair = "parsley"
}
