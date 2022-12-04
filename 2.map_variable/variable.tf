variable "userName" {
    type = string
}

variable "mapVariable" {
    type = map
    default = {
        Farhaan = 20
    }
}

output "userAge" {
  value = "My name is ${var.userName} and my age is ${lookup(var.mapVariable, "${var.userName}")}"
}