terraform {
  required_version = "1.10.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  backend "s3" {
    bucket         = "terraform-remote-state-2025"
    key            = "vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-devsecopsb44"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"

}