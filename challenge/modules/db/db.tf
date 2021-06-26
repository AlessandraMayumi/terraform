variable "ec2name" {
    type = string
}
resource "aws_instance" "ec2" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
    tags = {
        Name = var.ec2name
    }
}
output "private" {
  value = aws_instance.ec2.private_ip
  description = "The private IP address of the ec2 instance."
}