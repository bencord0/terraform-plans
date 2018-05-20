module "consul" {
  source = "../modules/consul"
}

module "secrets" {
  source = "../modules/secrets"
}

module "databases" {
  source = "../modules/databases"
}

module "web" {
  source = "../modules/web"
}
