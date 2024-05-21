terraform {
  cloud {
    organization = "wimvandenwyngaert"

    workspaces {
      name = "terraform-tests-test05"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.104.0"
    }
  }
}

provider "azurerm" {
  features {}
}
