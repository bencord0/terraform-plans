provider "matchbox" {
  endpoint = "matchbox.condi.me:443"
  client_cert = "${file("~/.matchbox/client.crt")}"
  client_key = "${file("~/.matchbox/client.key")}"
  ca = "${file("/etc/ssl/certs/ca-certificates.crt")}"
}

resource "matchbox_profile" "default" {
  name = "default"
  kernel = "https://dl.condi.me/gentoo-systemd/latest/vmlinuz.nosquash"
  initrd = [
    "https://dl.condi.me/gentoo-systemd/latest/initramfs.cpio",
  ]
  args = [
    "console=ttyS0,115200",
  ]
}

resource "matchbox_group" "default" {
  name = "default"
  profile = "${matchbox_profile.default.name}"
}
