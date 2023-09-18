variable "ebs_size" {
  default = "10"
}

variable "ebs_name_tag" {
  default = {
    Name = "ebs-mozka"
  }
}

variable "instancetype" {
  default = "t2.nano"
}

variable "ec2_name_tag" {
  default = {
    Name = "ec2-mozka"
  }
}