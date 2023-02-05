provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = "example-bucket-farrow-aman"
    key = "state.tfstate"
    region = "us-east-1"
    dynamodb_table = "farhaan-tf-state"    
  }
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

# variable "image_id" {
#   type = string
# }

# variable "instance_type" {
#   type = string
# }

# resource "aws_s3_bucket" "example-bucket-farrow-aman" {
#   bucket = "example-bucket-farrow-aman"
# }

resource "aws_instance" "web" {
	ami = "ami-0b0ea68c435eb488d"
	instance_type = "t2.micro"
}
