# terraform/main.tf

terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-444333222111"     # Replace with your actual state bucket
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"                 # Replace with your actual table name
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket        = "cicd-demo-bucket-prod"  # Fixed name
  force_destroy = true
}
