output "name" {
    description = "print public_ip"
    value = aws_instance.name.public_ip
  
}