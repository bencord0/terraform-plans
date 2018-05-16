module "consul" {
  source = "../modules/consul"
}

module "secrets" {
  source = "../modules/secrets"
}

module "web" {
  source = "../modules/web"
}
