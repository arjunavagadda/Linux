terraform{
    required_version = ">=0.14.0"
}

provider "aws" {
    region = "ap-southeast-1"
  
}

# Data sources
# Objects not managed by Terraform
data "aws_caller_identity" "currentuser" {
  
} # gives out aws user account details

data "aws_availability_zones" "AZS" {
    state = "available"
}

resource "aws_s3_bucket" "testbucket" {
    bucket = "bkt9102021"
  
}

output "bucketinfo" {
    value = aws_s3_bucket.testbucket
}
# interpolation
resource "aws_s3_bucket" "bucket3" {
  bucket = "${data.aws_caller_identity.currentuser.account_id}-bucket3"
}

# Dependency

resource "aws_s3_bucket" "bucket4" {
  bucket = "${data.aws_caller_identity.currentuser.account_id}-bucket4"
  tags = {
    Dependency = aws_s3_bucket.bucket3.arn
  }
}
 # explicit dependency
resource "aws_s3_bucket" "bucket4" {
  bucket = "${data.aws_caller_identity.currentuser.account_id}-bucket4"
   depends_on = [
    aws_s3_bucket.bucket3
  ]
}

## Variables

variable "varbucketname" {
  type = string
}

resource "aws_s3_bucket" "bucketvar" { # when we run terraform plan it asks for input
  bucket = var.varbucketname
}

## locals

locals {
  aws_account_name = "${data.aws_caller_identity.currentuser.account_id}-${lower(data.aws_caller_identity.currentuser.user_id)}"
}


resource "aws_s3_bucket" "localbucket" {
  bucket = "${local.aws_account_name}-bucket890"
}

## count

resource "aws_s3_bucket" "countbktname" {
  # count = 0 --> it won't check
  count = 4
  bucket = "${local.aws_account}-buket${count.index+7}" # creates 7 8 9 10 bkts
  
}

resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

variable "subnet_ids" {
  type = list(string)
}

resource "aws_instance" "server" {
  # Create one instance for each subnet
  count = length(var.subnet_ids)

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[count.index]

  tags = {
    Name = "Server ${count.index}"
  }
}


## conditional

/*If your instances are almost identical, count is appropriate. 
If some of their arguments need distinct values that can't be directly derived from an integer, 
it's safer to use for_each.*/

locals {
  bukets={
    bkt101 = "mybkt"
    bkt102 = "mybkt2"
  }
}

resource "aws_s3_bucket" "foreachbkt" {
  for_each = local.bukets
  bucket = "${local.aws_account}-buket${each.value}"
  
}

# datatypes

locals {
  a_string = "stringvar"
  a_number = 12
  a_bool = true
  a_list = [
    "element",34,true
  ]
  a_map = {
    key = "value"
  }
  person = {
    name = "robert",
    id = 24,
    active = false,
    phone = {
      home = "9959",
      office = "5678"
    }
  }

}

output "homephone" {
  value = local.person.phone.office
}

# operators

locals {
  three = 1+2
  t = true || false
  f = true && false
 
 gt = 2>1
}

## inbuilt functions

locals {
  ts = timestamp()
  cur_month = formatdate("MMMM",local.ts)
  tomorrow = formatdate("DD",timeadd(local.ts,"24h"))
}

output "infunc" {
  value = "${local.cur_month}${local.tomorrow}"
}


## string methods

locals{
  lowercase = "${lower("A mixed string")}"
  upper = "${upper("A mixed string")}"
  trimmed = "${trimspace("A mixed string trailing spaces    ")}"
  formatted = "${format("hello %s","world")}"
  formattedlist = "${(formatlist("hello %s",["john","paul","mikey"]))}"
}

output "string" {
  value = local.trimmed
}

/*formatted list o/p : 

string = [
  ""hello john",
  "hello paul"
]
*/

### backend

/* Each Terraform configuration can specify a backend, which defines where and 
how operations are performed, where state snapshots are stored, etc.*/

terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}

/*The remote backend stores Terraform state and may be used to run operations in Terraform Cloud.*/

/*

main.tf --> main file (var are reffered here)
variables.tf --> varibles file(get the values from tfvars)
env.tfvars ---> the only file we will edit to make changes to dif env

*/


## terraform refresh - state file is refreshed with the actual resources 

resource "aws_instance" "web" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  tags = {
    Name = "local-exec-provisioner"
  }
  
provisioner "local-exec" {
    command = "echo ${self.private_ip}, ${self.public_ip} >> private_and_public_ips.txt"
  }
  
}
























































