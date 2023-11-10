variable "rg-name" {}

variable "rg-location" {}

resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  location = var.rg-location
}

variable "first_name" {
  default = "Wim"
}

variable "last_name" {
  default = "Van den Wyngaert"
}


