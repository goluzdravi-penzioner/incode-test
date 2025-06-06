resource "kubernetes_service" "sf_app_service" {
  metadata {
    name      = "${var.app_name}-service"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    selector = {
      app = var.app_name
    }
    port {
      port        = 8080
      target_port = 8080
      protocol    = "TCP"
    }
    type = "ClusterIP"
  }
}