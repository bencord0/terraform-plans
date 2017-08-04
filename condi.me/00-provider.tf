provider "matchbox" {
  endpoint = "matchbox.condi.me:443"
  client_cert = "${file("~/.matchbox/client.crt")}"
  client_key = "${file("~/.matchbox/client.key")}"
  ca = "${file("/etc/ssl/certs/ca-certificates.crt")}"
}
