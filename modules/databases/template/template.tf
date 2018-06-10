variable "name" {}
variable "version" {
  default = "1"
}

resource "random_string" "password" {
  length  = 20
  special = false

  keepers = {
    version = "${var.version}"
  }
}

resource "postgresql_role" "role" {
  login = true

  name     = "${var.name}"
  password = "${random_string.password.result}"
}

resource "postgresql_database" "database" {
  name  = "${var.name}"
  owner = "${postgresql_role.role.name}"
}

output "username" {
  value = "${postgresql_role.role.name}"
}

output "password" {
  value = "${random_string.password.result}"
}

output "dbname" {
  value = "${postgresql_database.database.name}"
}
