provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "consul" {
    address = "https://consul.condi.me"
    path = "eu-west-1/terraform_state"
  }
}
