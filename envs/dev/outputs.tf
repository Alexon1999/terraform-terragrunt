resource "aws_instance" "dev_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "dev-ec2-instance"
  }
}

output "instance_id" {
  value = aws_instance.dev_ec2.id
}

output "public_ip" {
  value = aws_instance.dev_ec2.public_ip
}