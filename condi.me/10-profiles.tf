resource "matchbox_profile" "default" {
  name = "default"

  cloud_id = "default.yaml.tmpl"
  container_linux_config = "default.yaml.tmpl"

  kernel = "https://dl.condi.me/gentoo-systemd/20171230/vmlinuz.nosquash"
  initrd = [
    "https://dl.condi.me/gentoo-systemd/20171230/initramfs.cpio",
  ]
  args = [
    "console=ttyS0,115200",
    "cloud-config-url=http://matchbox.condi.me/cloud?mac=$${mac:hexhyp}",
    "systemd.unit=cloud.target",
  ]
}

resource "matchbox_profile" "installed" {
  name = "installed"

  cloud_id = "default.yaml.tmpl"
  container_linux_config = "default.yaml.tmpl"

  kernel = "https://dl.condi.me/gentoo-systemd/20171230/vmlinuz.nosquash"
  initrd = [
    "https://dl.condi.me/gentoo-systemd/20171230/initramfs.nosquash",
  ]
  args = [
    "root=ZFS=zpool/sysroot",
    "console=ttyS0,115200",
    "init=/usr/lib/systemd/systemd",
    "zfs_force",
    "spl.spl_hostid=0",
  ]
}
