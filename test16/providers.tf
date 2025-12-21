terraform {
  backend "local" {
    path = "/Users/wim/Documents/terraform-state/test16/terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "github" {}
