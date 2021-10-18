provider "aws"{
    region ="ap-southeast-1"
}

data "aws_availability_zones" "available" {}



data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  
}

output "awsaz"{
    value = data.aws_availability_zones.available.names[0]
}

output "awsami"{
    value = data.aws_ami.example.id
}