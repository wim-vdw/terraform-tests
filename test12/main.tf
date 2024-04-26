resource "azurerm_resource_group" "rg1" {
  location = "northeurope"
  name     = "rg-test12-part1"
  tags = {
    author = "Wim Van den Wyngaert"
    env    = "development"
  }
}

resource "azurerm_resource_group" "rg2" {
  location = "northeurope"
  name     = "rg-test12-part2"
  tags = {
    author = "Wim Van den Wyngaert"
    env    = "development"
  }
}
