terraform {
  backend "remote" {
    hostname     = "spacelift.io"
    organization = "wim-vdw"

    workspaces {
      name = "test"
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
