provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["$HOME/.aws/credentials"]
}

terraform {
  backend "s3" {
    bucket                  = "terraform-backend-mozka"
    key                     = "app.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "$HOME/.aws/credentials"
  }
}

module "ec2-module" {
  source = "./modules/ec2-module"
  instancetype = "t2.micro"
  sg_name_declaration = module.sg-module.sg_name
  ec2_name_tag = {
    Name = "vm-mozka"
  }
}

module "ebs-module" {
  source = "./modules/ebs-module"
  instance_az = module.ec2-module.ec2_az
  ebs_size = "8"
  ebs_name_tag = {
    Name = "volume-mozka"
  }
}

module "eip-module" {
  source = "./modules/eip-module"
  instance_id = module.ec2-module.ec2_id
}

module "sg-module" {
  source = "./modules/sg-module"
}