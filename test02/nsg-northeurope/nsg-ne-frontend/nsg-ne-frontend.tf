resource "azurerm_network_security_group" "nsg-ne-frontend" {
  name                = "nsg-ne-frontend"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "nsg-ne-frontend-id" {
  value = azurerm_network_security_group.nsg-ne-frontend.id
}
