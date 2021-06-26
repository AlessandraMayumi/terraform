variable "server_names" {
    type = list
}
resource "aws_instance" "ec2" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index]
    }
}
output "private" {
  value = aws_instance.ec2.*.private_ip
  description = "The private IP address of the ec2 instance."
}