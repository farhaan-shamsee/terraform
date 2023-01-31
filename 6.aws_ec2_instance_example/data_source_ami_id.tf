# here we are getting the ami image id and pass it to the EC2 instance getting 
#  created in instance.tf
data "aws_ami" "ubuntu" {
  most_recent = true

  # List of AMI owners to limit search. Valid values: an AWS account ID, self (the current account), 
  # or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft).
  owners = ["099720109477"]

  # below we define filters for the image
  filter {
    name = "name"
    # values = ["${var.image_name}"]
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230112"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}