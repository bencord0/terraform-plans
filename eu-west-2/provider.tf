provider "aws" {
  region  = "${var.region}"
  profile = "${var.region}"
}

provider "consul" {
  address = "consul.condi.me:443"
  scheme  = "https"
}

terraform {
  backend "consul" {}
}
