provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_key_pair" "deployer" {
  key_name   = "farhaan-test-tf-key"
  public_key = file("${path.module}/id_rsa.pub")
}

output "key_name" {
  value = aws_key_pair.deployer.key_name
}