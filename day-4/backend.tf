terraform {
  backend "s3" {
    bucket = "terraform.bucket0424"
    region = "ap-south-1"
    key = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
    
  }
}