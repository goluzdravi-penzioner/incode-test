
resource "kind_cluster" "k8s" {
  name       = "sap-test"
  node_image = "kindest/node:${var.kind_version}"
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    dynamic "node" {
      for_each = var.node_roles
      content {
        role = node.value

        dynamic "extra_port_mappings" {
          for_each = node.value == "control-plane" ? [1] : []
          content {
            container_port = 5432      # The port your service listens on INSIDE the cluster
            host_port      = 30003     # The port you want to access on your HOST machine
            protocol       = "TCP"     # Or "UDP" if your service uses UDP
            listen_address = "0.0.0.0" # Optional: Specify the host IP to listen on
          }
        }
      }
    }
  }
}

output "k8s" {
  value = kind_cluster.k8s
}