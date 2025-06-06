variable "kind_version" {
  default = "v1.27.1"
  type    = string
}

variable "node_roles" {
  type    = list(string)
  default = ["control-plane", "worker"]
}

