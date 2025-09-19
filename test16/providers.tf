terraform {
  backend "local" {
    path = "/Users/wim/Documents/terraform-state/terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {}
