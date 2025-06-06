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
  default = "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"
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