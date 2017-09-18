provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v2.0/"
  region = "SBG1"
}

terraform {
  backend "consul" {
    address = "https://consul.condi.me"
    path = "sbg1/terraform_state"
  }
}
