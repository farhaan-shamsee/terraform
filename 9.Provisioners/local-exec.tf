resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.instance_type
  tags = {
    Name = "first-tf-instance"
  }
  key_name        = aws_key_pair.deployer.key_name           # Referring to the key getting created above.
  security_groups = ["${aws_security_group.allow_tls.name}"] # Referring to the SG getting created above.
  user_data       = file("${path.module}/script.sh")

  # 3 provisioners: local-exec
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    # host = "${aws_instance.web.public_ip}" 
    # this will create a deadlock condition as the instance is dependent on tis own IP address
    host = self.public_ip
  }

  provisioner "local-exec" {
    working_dir = "/tmp/"
    command     = "echo ${self.public_ip} > mypublicip.txt"
  }

  provisioner "local-exec" {
    working_dir = "/tmp/"
    interpreter = [
      "/usr/bin/python3", "-c"
    ]
    command = "print('Hello World)"
  }

  provisioner "local-exec" {
    command = "env>env.txt"
    environment = {
      envname = "envalue"
    }
  }

  provisioner "local-exec" {
    command = "echo 'at Create'"
  }


  provisioner "local-exec" {
    when = destroy      #this only runs when aws_instance.web is deleted. It is not connected with any other resource.
    command = "echo 'at delete'"
  }

  # on failure behaviour
  provisioner "local-exec" {
    on_failure = continue
    command = "env>env.txt"
    environment = {
      envname = "envalue"
    }
  }
}