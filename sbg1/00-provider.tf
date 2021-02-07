provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3"
  region   = "SBG1"
}

terraform {
  backend "consul" {
    address = "consul.condi.me"
    scheme  = "https"
    path    = "sbg1/terraform_state"
  }
}
