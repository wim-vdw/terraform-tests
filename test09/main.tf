resource "azurerm_resource_group" "rg" {
  name     = "rg-test09"
  location = "northeurope"
}

variable "first_name" {
  default = "Wim"
}

variable "last_name" {
  default = "Van den Wyngaert"
}
