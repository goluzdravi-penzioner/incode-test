
resource "helm_release" "postgres" {
  name      = "sf-postgres"
  namespace = kubernetes_namespace.app.metadata[0].name
  chart     = "oci://registry-1.docker.io/bitnamicharts/postgresql"
  version   = "16.6.6"

  values = [
    yamlencode({
      auth = {
        username = "testuser"
        password = random_password.postgres_password.result
        database = "testdb"
      },
      primary = {
        persistence = {
          enabled = true
          size    = "1Gi"
        }
      },
      service = {
        type = "NodePort"
        nodePorts = {
          postgresql = 30007
      } }
      }
    )
  ]
}