variable "aws_key" {}
variable "aws_secret" {}

atlas {
    name = "wkirschbaum/happyspike-staging"
}

provider "aws" {
    access_key = "${var.aws_key}"
    secret_key = "${var.aws_secret}"
    region = "eu-west-1"
}

resource "aws_instance" "web" {
    ami = "ami-bff32ccc"
    instance_type = "t2.micro"
    tags {
        Name = "dokku 1"
    }
}
