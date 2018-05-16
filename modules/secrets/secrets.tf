data "pass_password" "registry" {
  path = "registry.condi.me/registry"
}

locals {
  k_namespaces = [
    "default",
    "gentoo",
    "web",
    "webhooks",
  ]
}

resource "kubernetes_secret" "registry" {
  count = "${length(local.k_namespaces)}"

  metadata {
    name      = "registry"
    namespace = "${element(local.k_namespaces, count.index)}"
  }

  data {
    ".dockerconfigjson" = "{\"auths\": {\"registry.condi.me\": {\"auth\": \"${base64encode("registry:${data.pass_password.registry.password}")}\"}}}"
  }

  type = "kubernetes.io/dockerconfigjson"
}
