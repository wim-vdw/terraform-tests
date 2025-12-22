terraform {
  cloud {
    organization = "wimvandenwyngaert"

    workspaces {
      name = "Landingzone"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.72.0"
    }
  }
}
