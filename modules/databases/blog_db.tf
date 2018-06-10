module "blog" {
  source = "./template"
  name   = "blog"
}

locals {
  blog_database_url = "postgres://${module.blog.name}:${module.blog.password}@${local.internal_ip}:5432/${module.blog.dbname}"
}

resource "kubernetes_secret" "blog_database" {
  metadata {
    name      = "database"
    namespace = "blog"
  }

  data {
    DATABASE_URL = "${local.blog_database_url}"
  }
}
