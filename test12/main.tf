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
    env    = "integration"
  }
}

resource "azurerm_resource_group" "rg3" {
  location = "northeurope"
  name     = "rg-test12-part3"
  tags = {
    author = "Wim Van den Wyngaert"
    env    = "acceptance"
  }
}

resource "azurerm_resource_group" "rg4" {
  location = "northeurope"
  name     = "rg-test12-part4"
  tags = {
    author = "Wim Van den Wyngaert"
    env    = "production"
  }
}
