variable "access_key" {}
variable "secret_key" {}

terraform {
  backend "s3" {
    bucket         = "mediawiki"
    region         = "ap-south-1"
	key    		   = "mediawiki/terraform.tfstate"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}


resource "aws_security_group" "IaC" {
  name = "mediawiki"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-0d565c469efae0efa"
  instance_type          = "m5.xlarge"
  key_name               = "production"
  vpc_security_group_ids = ["${aws_security_group.IaC.id}"]
  associate_public_ip_address = true
  monitoring			=	true
  tags = {
    Name = "Mediawiki"
  }
  
  root_block_device {
   volume_type = "gp2"
   volume_size = 100
  }
}
