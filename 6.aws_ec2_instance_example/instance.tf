resource "aws_key_pair" "deployer" {
  key_name   = "farhaan-test-tf-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  tags = {
    Name = "first-tf-instance"
  }
  key_name        = aws_key_pair.deployer.key_name         # Referring to the key getting created above.
  security_groups = ["${aws_security_group.allow_tls.name}"] # Referring to the SG getting created above.
}