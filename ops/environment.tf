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

resource "aws_elb" "web" {
    name = "hello-world-elb"

    # The same availability zone as our instances
    availability_zones = ["${aws_instance.web.*.availability_zone}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }

    # The instances are registered automatically
    instances = ["${aws_instance.web.*.id}"]
}

resource "aws_instance" "web" {
    ami = "ami-bff32ccc"
    instance_type = "t2.micro"
    count = 2
}
