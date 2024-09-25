# Provider configuration
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "terrateam-instance" {
  ami = "ami-0e86e20dae9224db8" 
  instance_type = "t2.micro"
  subnet_id = "subnet-02efa144df0a77c13" 

  tags = {
    Name        = "TerraTeamInitialInstance"
    Environment = "Testing"
  }
}

# Terraform backend configuration using the testing state bucket
terraform {
  backend "s3" {
    bucket         = "terrateam-state-testing-09" 
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terrateam-state-lock-01"
    encrypt        = true
  }
}
