provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3"
  region   = "UK1"
}

terraform {
  cloud {
    hostname     = "tf.condi.me"
    organization = "bencord0"

    workspaces {
      name = "terraform-plans_uk1"
    }
  }

  required_version = ">= 1.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}
