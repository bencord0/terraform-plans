output "web_ip" {
  value = "${kubernetes_service.web.load_balancer_ingress.ip}"
}
