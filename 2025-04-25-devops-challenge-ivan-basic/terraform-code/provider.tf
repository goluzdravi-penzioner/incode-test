terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }

  }
}


provider "kubernetes" {
  host                   = module.kind_cluster.k8s.endpoint
  client_certificate     = module.kind_cluster.k8s.client_certificate
  client_key             = module.kind_cluster.k8s.client_key
  cluster_ca_certificate = module.kind_cluster.k8s.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = module.kind_cluster.k8s.endpoint
    client_certificate     = module.kind_cluster.k8s.client_certificate
    client_key             = module.kind_cluster.k8s.client_key
    cluster_ca_certificate = module.kind_cluster.k8s.cluster_ca_certificate
  }
}

