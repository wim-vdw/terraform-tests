terraform {
  backend "local" {
    path          = "/Users/wim/Documents/terraform-state/terraform.tfstate"
    workspace_dir = "/Users/wim/Documents/terraform-state/extra-workspaces"
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
