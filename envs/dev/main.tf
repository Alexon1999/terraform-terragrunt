module "ec2" {
  source        = "../../modules/ec2"
  instance_type = var.instance_type
  ami_id        = var.ami_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}
