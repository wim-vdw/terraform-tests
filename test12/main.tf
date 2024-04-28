resource "azurerm_resource_group" "rg1" {
  location = "northeurope"
  name     = "rg-test12-part1"
  tags = {
    env = "development"
  }
}

resource "azurerm_resource_group" "rg2" {
  location = "northeurope"
  name     = "rg-test12-part2"
  tags = {
    env = "integration"
  }
}

resource "azurerm_resource_group" "rg3" {
  location = "northeurope"
  name     = "rg-test12-part3"
  tags = {
    env = "acceptance"
  }
}

resource "azurerm_resource_group" "rg4" {
  location = "northeurope"
  name     = "rg-test12-part4"
  tags = {
    env = "production"
  }
}

output "rg1" {
  value = azurerm_resource_group.rg1
}

output "rg2" {
  value = azurerm_resource_group.rg2
}

output "rg3" {
  value = azurerm_resource_group.rg3
}

output "rg4" {
  value = azurerm_resource_group.rg4
}
