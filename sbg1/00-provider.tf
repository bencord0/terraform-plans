provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3"
  region   = "SBG1"
}

terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }

    consul = {
      source = "hashicorp/consul"
    }
  }

  backend "consul" {
    address = "consul.condi.me"
    scheme  = "https"
    path    = "sbg1/terraform_state"
  }
}
