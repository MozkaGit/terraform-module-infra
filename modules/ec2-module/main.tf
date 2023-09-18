data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  key_name        = "devops-mozka"
  security_groups = ["${var.sg_name_declaration}"]
  tags            = var.ec2_name_tag

  provisioner "remote-exec" {
    inline = [
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./devops-mozka.pem")
      host        = self.public_ip
    }
  }
}