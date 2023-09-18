variable "instancetype" {
  default = "t2.nano"
}

variable "ec2_name_tag" {
  default = {
    Name = "ec2-mozka"
  }
}

variable "sg_name_declaration" {
  description = "Security group name"
}