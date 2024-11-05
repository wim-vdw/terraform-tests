terraform {
  cloud {
    organization = "wimvandenwyngaert"

    workspaces {
      name = "Landingzone"
    }
  }

  required_providers {
    tfe = {
      version = ">=0.0.1,<1.0.0"
    }
  }
}
