resource "random_password" "postgres_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_secret" "postgres_password" {
  metadata {
    name      = "postgres-auth"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  type = "Opaque"
  data = {
    postgres-password = random_password.postgres_password.result
  }
}

resource "kubernetes_secret" "registry_secret_tf" {
  metadata {
    name      = "ghcr-image-pull-secret"
    namespace = var.namespace
  }

  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode({
      "auths" : {
        "https://ghcr.io" : {
          username = var.registry_user
          password = var.registry_password
          auth     = base64encode(join(":", ["${var.registry_user}", "${var.registry_password}"]))
        }
      }
    })
  }
}

