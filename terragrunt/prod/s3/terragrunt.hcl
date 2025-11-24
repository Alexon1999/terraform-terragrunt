include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../terraform/modules/s3"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  bucket_name   = local.environment_vars.locals.bucket_name
  acl           = local.environment_vars.locals.acl
  force_destroy = local.environment_vars.locals.force_destroy
  tags          = local.environment_vars.locals.tags
}
