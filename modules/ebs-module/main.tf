resource "aws_ebs_volume" "ebs" {
  availability_zone = var.instance_az
  size              = var.ebs_size

  tags = var.ebs_name_tag
}