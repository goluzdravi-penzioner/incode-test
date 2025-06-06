module "kind_cluster" {
  source = "./modules/kind-cluster"
}

module "microservice-a" {
  source            = "./modules/app"
  namespace         = "sapf-test"
  registry_password = var.registry_password
  registry_user     = var.registry_user
  registry_server   = var.registry_server
  image             = var.image
  image_tag         = var.image_tag
  app_name          = "sf-app"
}
