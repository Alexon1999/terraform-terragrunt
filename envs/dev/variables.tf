variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-localstack"
}
