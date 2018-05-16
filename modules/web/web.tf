locals {
  app       = "web"
  namespace = "web"
}

resource "kubernetes_namespace" "web" {
  metadata {
    name = "${local.namespace}"
  }
}

resource "kubernetes_replication_controller" "web" {
  metadata {
    generate_name = "${local.namespace}-"
    namespace     = "${local.namespace}"

    labels {
      app = "${local.app}"
    }
  }

  spec {
    selector {
      app = "${local.app}"
    }

    template {
      container {
        image = "nginx"
        name  = "${local.app}"

        port {
          container_port = 80
        }
      }
    }
  }
}

resource "kubernetes_service" "web" {
  metadata {
    generate_name = "${local.namespace}-"
    namespace     = "${local.namespace}"
  }

  spec {
    selector {
      app = "${local.app}"
    }

    port {
      name = "http"
      port = 80

      target_port = 80
    }

    type             = "LoadBalancer"
  }
}
