resource "aws_s3_bucket" "name" {
    bucket = "asffhdgjlhli" 
  
}

terraform {
  backend "s3" {
    bucket = "terraform.bucket0424"
    region = "ap-south-1  "
    key = "terraform.tfstate"
    encrypt = true
    
  }
}