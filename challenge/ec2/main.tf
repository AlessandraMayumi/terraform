provider "aws" {
    region = "us-east-1"
}
# Create a DB Server and output the private IP
resource "aws_instance" "db" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
    tags = {
        Name = "DB Server"
    }
}
# Create a Web Server and ensure it has a fixed public IP
resource "aws_instance" "web" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_traffic.name]
    user_data = file("server-script.sh")
    tags = {
        Name = "Web Server"
    }
}
resource "aws_eip" "web_ip"{
    instance = aws_instance.web.id
}
# Create a Security Group for the web server opening ports 80 and 443 (HTTP and HTTPS)
variable "ingressrules" {
    type = list(number)
    default = [80,443]
}
variable "egressrules" {
    type = list(number)
    default = [80,443]
}
resource "aws_security_group" "web_traffic" {
    name = "Allow HTTPS"

    dynamic "ingress" { 
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" { 
        iterator = port
        for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
# Outputs
output "PrivateIP" {
  value = aws_instance.db.private_ip
  description = "The private IP address of the db ec2 instance."
}
output "PublicIP" {
  value = aws_eip.web_ip.public_ip
  description = "The Elastic IP address of the web ec2 instance."
}