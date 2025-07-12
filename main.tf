terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-2"
}

data "aws_security_group" "example" {
  tags = {
    env   = "dev"
  }
}


resource "aws_instance" "this" {
  ami                     = "ami-01c837d5176a7605d"
  instance_type           = "t3.nano"
  vpc_security_group_ids = [data.aws_security_group.example.id]


}
