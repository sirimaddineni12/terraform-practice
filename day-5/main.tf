resource "aws_sns_topic" "user_up-dates" {
  name = "user_up-topic"
}

terraform {
  backend "s3" {
    bucket = "terraform.bucket0424"
    region = "ap-south-1"
    key = "terraform.tfstate"
    encrypt = true
    
  }
}