terraform {
  required_version = ">= 1.0"
  required_providers {
    consul = {
      source = "hashicorp/consul"
    }

    ovh = {
     source = "ovh/ovh"
    }
  }

  backend "consul" {
    address = "consul.condi.me"
    scheme  = "https"
    path    = "ovh-eu/terraform_state"
  }
}

provider "ovh" {
  endpoint = "ovh-eu"
}
