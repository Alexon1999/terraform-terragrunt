terraform {
  backend "s3" {
    bucket = "tfstate"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
