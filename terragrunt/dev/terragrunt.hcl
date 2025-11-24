include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  instance_type = "t2.micro"
  ami_id        = "ami-0c55b159cbfafe1f0"
}

inputs = {
}
