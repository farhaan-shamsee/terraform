provider "aws" {
  region     = "use-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

# DOcs about the aws_ami datasource: 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = [self]

  # below we difine filters for the image
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtulization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}