provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3"
  region   = "UK1"
}

terraform {
  required_version = ">= 0.14.0"
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
    path    = "uk1/terraform_state"
  }
}
