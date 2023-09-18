output "ec2_id" {
  value = aws_instance.ec2.id
}

output "ec2_az" {
  value = aws_instance.ec2.availability_zone
}