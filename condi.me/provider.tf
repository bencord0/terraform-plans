provider "kubernetes" {}

provider "consul" {
  address = "consul.condi.me"
  scheme  = "https"
}

provider "pass" {}

terraform {
  # Set CONSUL_HTTP_TOKEN to authenticate the backend
  backend "consul" {
    address = "https://consul.condi.me"
    path    = "condi.me/tf/terraform_state"
  }
}
