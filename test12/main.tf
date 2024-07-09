resource "azurerm_resource_group" "rg1" {
  location = "northeurope"
  name     = "rg-test12-part1"
  tags = {
    env       = "development"
    manage-by = "Spacelift"
  }
}

resource "azurerm_resource_group" "rg2" {
  location = "northeurope"
  name     = "rg-test12-part2"
  tags = {
    env       = "production"
    manage-by = "Spacelift"
  }
}

output "rg1" {
  value = azurerm_resource_group.rg1
}

output "rg2" {
  value = azurerm_resource_group.rg2
}
