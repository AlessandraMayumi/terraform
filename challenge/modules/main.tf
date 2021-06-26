provider "aws" {
    region = "us-east-1"
}
module "ec2moduleDB" {
    source = "./db"
    ec2name = "DB Server Module"
}
module "ec2moduleWeb" {
    source = "./web"
    ec2name = "Web Server Module"
}
output "PrivateIP" {
  value = module.ec2moduleDB.private
  description = "The private IP address of the db ec2 instance."
}
output "PublicIP" {
  value = module.ec2moduleWeb.elastic
  description = "The Elastic IP address of the web ec2 instance."
}
