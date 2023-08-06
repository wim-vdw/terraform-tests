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
      version = ">= 3.0.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
