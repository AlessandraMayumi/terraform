provider "aws" {
    region = "us-east-1"
}

variable "vpcname" {
    type = string
    default = "TerraformVPC"
}

resource "aws_vpc" "myvpc" { 
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = var.vpcname
    }
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["value1", "value2"]
}

variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}