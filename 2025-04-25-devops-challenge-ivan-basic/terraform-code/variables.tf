variable "namespace" {
  type    = string
  default = "sapf-test"
}

variable "registry_user" {
  type    = string
  default = "nevena-nedeljkovic-fioneer"
}

variable "registry_password" {
  type    = any
  default = ""
}

variable "registry_server" {
  type = string
}

variable "image" {
  type = string
}

variable "image_tag" {
  type = string
}