resource "matchbox_profile" "default" {
  name = "default"

  cloud_id = "default.yaml.tmpl"
  container_linux_config = "default.yaml.tmpl"

  kernel = "https://dl.condi.me/gentoo-systemd/20170613/vmlinuz.nosquash"
  initrd = [
    "https://dl.condi.me/gentoo-systemd/20170613/initramfs.cpio",
  ]
  args = [
    "console=ttyS0,115200",
    "cloud-config-url=http://matchbox.condi.me/cloud?mac=$${mac:hexhyp}",
    "systemd.unit=cloud.target",
  ]
}

resource "matchbox_profile" "kubelet" {
  name = "kubelet"

  cloud_id = "default.yaml.tmpl"
  container_linux_config = "default.yaml.tmpl"

  kernel = "https://dl.condi.me/kube/vmlinuz-4.9.16-gentoo",
  initrd = [
    "https://dl.condi.me/kube/initramfs-4.9.16-gentoo.img",
  ]
  args = [
    "root=ZFS=zpool/sysroot",
    "console=ttyS0,115200",
    "init=/usr/lib/systemd/systemd",
    "zfsforce=1",
  ]
}
