terraform {
  backend "local" {
    path = "/Users/wim/Documents/terraform-state/test15/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
