provider "aws" {
    access_key = "${var.aws_key}"
    secret_key = "${var.aws_secret}" 
    region = "eu-west-1"
}

resource "aws_instance" "example" {
    ami = "ami-bff32ccc"
    instance_type = "t2.micro"
}
