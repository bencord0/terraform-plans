output "postgres_ip" {
  value = "${data.kubernetes_service.shared-postgres.load_balancer_ingress.0.ip}"
}
