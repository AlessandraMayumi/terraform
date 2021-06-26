variable "ec2name" {
    type = string
}
resource "aws_instance" "ec2" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
    security_groups = [module.sg.sq_name]
    user_data = file("./web/server-script.sh")
    tags = {
        Name = var.ec2name
    }
}
output "elastic" {
  value = module.eip.elastic
}
module "eip" {
    source = "./eip"
    instance_id = aws_instance.ec2.id
}
module "sg" {
    source = "./sg"
}