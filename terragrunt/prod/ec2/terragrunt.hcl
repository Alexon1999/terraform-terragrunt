include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../terraform/modules/ec2"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  instance_type = local.environment_vars.locals.instance_type
  ami_id        = local.environment_vars.locals.ami_id
}
