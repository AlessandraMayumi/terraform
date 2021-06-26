provider "aws" {
    region = "us-east-1"
}
# cidr block from a vpc created using the console
# terraform import aws_vpc.myvpc vpc-03db7c242cd8c8929
resource "aws_vpc" "myvpc" { 
    cidr_block = "192.168.0.0/24"
}