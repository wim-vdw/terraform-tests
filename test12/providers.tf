terraform {
  backend "remote" {
    hostname     = "spacelift.io"
    organization = "wim-vdw"

    workspaces {
      name = "test"
    }
  }
}

provider "azurerm" {
  features {}
}
