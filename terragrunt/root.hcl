locals {
  localstack_endpoint = "http://localhost.localstack.cloud:4566"
  s3_endpoint         = "http://s3.localhost.localstack.cloud:4566"
}

# Backend S3 partagé pour tous les environnements
remote_state {
  backend = "s3"
  config = {
    bucket                      = "tfstate"
    region                      = "us-east-1"
    key                         = "${path_relative_to_include()}/terraform.tfstate"
    endpoint                    = local.s3_endpoint
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Génération automatique du provider AWS LocalStack
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF

terraform {
}

provider "aws" {
  access_key = "${get_env("AWS_ACCESS_KEY_ID", "test")}"
  secret_key = "${get_env("AWS_SECRET_ACCESS_KEY", "test")}"
  region     = "us-east-1"

  skip_credentials_validation = true
  skip_region_validation      = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "${local.localstack_endpoint}"
    apigatewayv2   = "${local.localstack_endpoint}"
    cloudformation = "${local.localstack_endpoint}"
    cloudwatch     = "${local.localstack_endpoint}"
    dynamodb       = "${local.localstack_endpoint}"
    ec2            = "${local.localstack_endpoint}"
    es             = "${local.localstack_endpoint}"
    elasticache    = "${local.localstack_endpoint}"
    firehose       = "${local.localstack_endpoint}"
    iam            = "${local.localstack_endpoint}"
    kinesis        = "${local.localstack_endpoint}"
    lambda         = "${local.localstack_endpoint}"
    rds            = "${local.localstack_endpoint}"
    redshift       = "${local.localstack_endpoint}"
    route53        = "${local.localstack_endpoint}"
    s3             = "${local.s3_endpoint}"
    secretsmanager = "${local.localstack_endpoint}"
    ses            = "${local.localstack_endpoint}"
    sns            = "${local.localstack_endpoint}"
    sqs            = "${local.localstack_endpoint}"
    ssm            = "${local.localstack_endpoint}"
    stepfunctions  = "${local.localstack_endpoint}"
    sts            = "${local.localstack_endpoint}"
  }
}
EOF
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
)