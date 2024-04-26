resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test12"
  tags = {
    author = "Wim Van den Wyngaert"
    env    = "development"
  }
}
