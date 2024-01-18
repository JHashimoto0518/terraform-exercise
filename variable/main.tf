terraform {
  # required_version = "1.3.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "4.52.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["ap-northeast-1"]
}

output "availability_zone_names" {
  value       = var.availability_zone_names
  description = "value of availability_zone_names"
}
