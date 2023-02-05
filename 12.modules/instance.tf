module "webserver" {
  source = "./modules/webserver"
  image_id = var.image_id
  instance_type = var.instance_type
  key = file("${path.module}/id_rsa.pub")
}

output "myPublicIP" {
  value = module.webserver.publicIP
}