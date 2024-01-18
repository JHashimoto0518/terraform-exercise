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

variable "buckets" {
  type        = list(string)
  description = "buckets to import"
}

import {
  for_each = { for b in var.buckets : b => b }
  to       = aws_s3_bucket.this[each.key]
  id       = each.value
}

resource "aws_s3_bucket" "this" {
  for_each = { for b in var.buckets : b => b }
  bucket   = each.value
}