resource "kubernetes_deployment" "sf_app" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }
      spec {
        image_pull_secrets {
          name = kubernetes_secret.registry_secret_tf.metadata[0].name
        }
        container {
          image = "${var.registry_server}/${var.image}:${var.image_tag}"
          name  = "sf-container"

          command = ["java"]
          args = [
            "-XX:MaxRAMPercentage=80.0",
            "-cp",
            "@/app/jib-classpath-file",
            "com.fioneer.devopschallenge.devopsbackend.DevopsBackendApplication"
          ]

          resources {
            limits = {
              memory = "1Gi"
            }
          }

          env {
            name  = "SPRING_DATASOURCE_URL"
            value = "jdbc:postgresql://sf-postgres-postgresql:5432/testdb"
          }

          env {
            name  = "SPRING_DATASOURCE_USERNAME"
            value = "testuser"
          }

          env {
            name  = "SPRING_DATASOURCE_PASSWORD"
            value = random_password.postgres_password.result
          }

          env {
            name  = "APP_SAMPLE_VALUE"
            value = "dfg123qwer1288"
          }

        }
      }
    }
  }
}