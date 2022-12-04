output hello1 {
    value = "hello world"
}

output hello2 {
    value = "hello world"
}


output "printUserName" {
  value = "Hello, ${upper(var.username)}, age ${var.age}"
}