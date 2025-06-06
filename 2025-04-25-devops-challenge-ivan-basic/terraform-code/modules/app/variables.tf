variable "namespace" {
  type    = string
  default = "sapf-test"
}

# variable "registry_user" {
#   type = string
# }

# variable "registry_password" {
#   type = string
# }

variable "registry_server" {
  type = string
}

variable "image" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "registry_user" {
  type = string
}

variable "registry_password" {
  type = any
}

variable "app_name" {
  type = string
}