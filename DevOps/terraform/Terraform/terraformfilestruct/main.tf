provider "aws" {
  
}

resource "aws_vpc" "mainvpc" {
  tags = {
    "name" = var.vpc_name
  }
}

