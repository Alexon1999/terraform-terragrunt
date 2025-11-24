include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../infrastructure-modules//ec2"
}

inputs = {
  instance_type = local.instance_type
  ami_id        = local.ami_id
}
