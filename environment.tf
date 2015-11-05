 provider "aws" {
  2     access_key = "${var.aws_key}"
  3     secret_key = "${var.aws_secret}" 
  4     region = "eu-west-1"
  5 }
  6 
  7 resource "aws_instance" "example" {
  8     ami = "ami-bff32ccc"
  9     instance_type = "t2.micro"
 10 }
