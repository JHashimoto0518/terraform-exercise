terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "test-1" {
  bucket = "tf-bulk-import-test-1"
}

resource "aws_s3_bucket" "test-2" {
  bucket = "tf-bulk-import-test-2"
  tags = {
    "versioning" = "true"
  }
}

