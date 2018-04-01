provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "consul" {
    address = "https://consul.condi.me"
    path = "eu-west-2/terraform_state"
  }
}
