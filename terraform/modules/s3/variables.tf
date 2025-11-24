variable "bucket_name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}