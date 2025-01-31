terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "exp-dev"
    key = "exp-dev-vpc"
    region = "us-east-1"
    dynamodb_table = "exp-dev-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
