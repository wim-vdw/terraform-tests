terraform {
  backend "local" {
    path = "/Users/wim/Documents/terraform-state/test01/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "68e6457c-2535-41df-901d-fd3d34d87a56"
}
