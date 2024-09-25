
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terrateam-env-bucket-9298" {
  bucket = "terrateam-demo-bucket-092798"  # Replace with your preferred bucket name
  acl    = "private"

  tags = {
    Name        = "TerraTeamDemoBucket"
    Environment = "Testing"
  }
}

terraform {
  backend "s3" {
    bucket         = "terrateam-state-testing-09"  # Initial backend bucket
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terrateam-state-lock-01"
    encrypt        = true
  }
}
