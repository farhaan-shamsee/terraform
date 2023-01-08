output "printFile" {
  value = file("${path.module}/test.txt")
}
# File function prints the content of the file. We have to provide the path of the file as argument.
# path.module refers to the directory where expression is present.