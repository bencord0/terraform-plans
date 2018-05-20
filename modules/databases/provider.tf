data "kubernetes_service" "shared-postgres" {
  metadata {
    name      = "postgres"
    namespace = "shared-databases"
  }
}

data "pass_password" "postgres" {
  path = "shared-databases/postgres"
}

provider "postgresql" {
  host = "${local.external_ip}"
  port = "5432"

  database = "postgres"
  username = "postgres"
  password = "${data.pass_password.postgres.password}"

  sslmode         = "require"
  connect_timeout = 15
}

locals {
  external_ip = "${data.kubernetes_service.shared-postgres.load_balancer_ingress.0.ip}"
  internal_ip = "${data.kubernetes_service.shared-postgres.spec.0.cluster_ip}"
}
