resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.instance_type
  tags = {
    Name = "first-tf-instance"
  }
  key_name        = aws_key_pair.deployer.key_name           # Referring to the key getting created above.
  security_groups = ["${aws_security_group.allow_tls.name}"] # Referring to the SG getting created above.
  user_data       = file("${path.module}/script.sh")
}