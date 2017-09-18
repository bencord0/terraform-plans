provider "matchbox" {
  endpoint = "matchbox.condi.me:443"
  client_cert = "${file("~/.matchbox/client.crt")}"
  client_key = "${file("~/.matchbox/client.key")}"
  ca = "${file("/etc/ssl/certs/ca-certificates.crt")}"
}

terraform {
  backend "consul" {
    address = "https://consul.condi.me"
    path = "condi.me/terraform_state"
  }
}
