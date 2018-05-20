output "web_ip" {
  value = "${module.web.web_ip}"
}

output "postgres_ip" {
  value = "${module.databases.postgres_ip}"
}
