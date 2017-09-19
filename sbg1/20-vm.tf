resource "openstack_compute_instance_v2" "kube1" {
  name = "kube1"

  image_id = "fe3e8f33-1f9d-4d57-89a2-6167e3d58571"  # CoreOS Stable
  flavor_id = "164fcc7e-7771-414f-a607-b388cb7b7aa0"  # vps-ssd-1
  key_pair = "pure"

  user_data = "${file("./userdata/kube1")}"
  security_groups = [
    "ssh",
    "web",
  ]
}
