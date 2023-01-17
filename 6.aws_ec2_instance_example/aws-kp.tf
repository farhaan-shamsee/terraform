resource "aws_key_pair" "deployer" {
  key_name   = "farhaan-test-tf-key"
  public_key = file("${path.module}/id_rsa.pub")
}