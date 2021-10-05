terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    consul = {
      source = "hashicorp/consul"
    }
  }

  backend "consul" {
    address = "consul.condi.me"
    scheme  = "https"
  }
}

provider "aws" {
  region  = var.region
  profile = var.region
}

provider "consul" {
  address = "consul.condi.me:443"
  scheme  = "https"
}
