variable "ebs_size" {
  default = "10"
}

variable "ebs_name_tag" {
  default = {
    Name = "ebs-mozka"
  }
}

variable "instance_az" {
  description = "AZ of ec2 machine"
}