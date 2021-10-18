provider "aws" {
    region = "ap-southeast-1"
}
resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terrformvpc"
  }
}
resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Pubsub"
  }
}
resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Privatesub"
  }
}
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyIGW"
  }
}
resource "aws_route_table" "publicroute" {
  vpc_id = aws_vpc.myvpc.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.IGW.id
    }
  ]

  tags = {
    Name = "Pubroute"
  }
}
resource "aws_route_table_association" "publicassociation" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicroute.id
}
resource "aws_eip" "eip" {
  vpc      = true
}
resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publicsubnet.id

  tags = {
    Name = "myNAT"
  }
}
resource "aws_route_table" "privateroute" {
  vpc_id = aws_vpc.myvpc.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.natgateway.id
    }
  ]

  tags = {
    Name = "privateroute"
  }
}
resource "aws_route_table_association" "privateassociation" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privateroute.id
}
resource "aws_security_group" "allow_all" {
  name        = "allow_all_traffic"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    },
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  tags = {
    Name = "SGAllowALL"
  }
}
resource "aws_instance" "publicec2" {
  ami           = "ami-082105f875acab993" # ap-southeast-1
  instance_type = "t2.micro"
  subnet_id = aws_subnet.publicsubnet.id
  key_name = "SingaporekeyED25519"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
   tags = {
    Name = "PublicEC2"
  }
}



