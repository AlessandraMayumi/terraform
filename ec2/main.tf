provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
}