variable "ports" {
  type = list(number)
  #   default = [ 22, 80, 443 ]
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}