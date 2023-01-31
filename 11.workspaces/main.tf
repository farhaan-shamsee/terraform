provider "aws" {
    region     = "us-east-1"
}
resource "aws_instance" "test-instance" {
  ami           = var.image_id
  instance_type = var.instance_type
}