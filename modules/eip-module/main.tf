resource "aws_eip" "lb" {
  instance = var.instance_id
  domain   = "vpc"

  provisioner "local-exec" {
    command = "echo IP: ${aws_eip.lb.public_ip} >> ip_ec2.txt"
  }
}