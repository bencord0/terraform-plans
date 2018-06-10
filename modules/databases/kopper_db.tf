module "kopper" {
  source = "./template"
  name   = "kopper"
}

locals {
  kopper_database_url = "postgres://${module.kopper.username}:${module.kopper.password}@${local.internal_ip}:5432/${module.kopper.dbname}"
}

resource "kubernetes_secret" "kopper_database" {
  metadata {
    namespace = "kopper"
    name      = "database"
  }

  data {
    DATABASE_URL = "${local.kopper_database_url}"
  }
}
