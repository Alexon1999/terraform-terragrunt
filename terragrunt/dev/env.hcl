locals {
  instance_type = "t2.micro"
  ami_id        = "ami-0c55b159cbfafe1f0"
  bucket_name = "my-unique-bucket-name"
  acl         = "private"
  force_destroy = true
  tags = {
    Environment = "dev"
    Project     = "MyProject"
  }
}
