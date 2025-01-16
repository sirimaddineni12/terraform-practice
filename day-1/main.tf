resource "aws_instance" "name" {
    ami = var.ami
    subnet_id = var.subnet
    instance_type = var.type
    key_name = var.key
    availability_zone = var.az
  
}