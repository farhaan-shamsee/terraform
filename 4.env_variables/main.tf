variable "username" {
  type = string
}


output "printUserName" {
  value = "Hello, ${var.username}"
}