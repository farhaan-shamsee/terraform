output "publicIP" {
  value = aws_instance.test-instance.public_ip
}