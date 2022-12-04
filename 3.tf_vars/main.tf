variable "username" {
  type = string
}

variable "age" {
  type = number
}


output "printUserName" {
  value = "Hello, ${upper(var.username)}, age ${var.age}"
}