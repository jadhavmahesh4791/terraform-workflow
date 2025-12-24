# backend.tf
terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "my-tf-state-git-workflow"
    key     = "prod/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
    // dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::408190482558:role/my-master-role"
  }

  default_tags {
    tags = {
      Environment = "production"
      ManagedBy   = "Terraform"
    }
  }
}