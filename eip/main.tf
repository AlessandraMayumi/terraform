resource "aws_eip" {
    instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}