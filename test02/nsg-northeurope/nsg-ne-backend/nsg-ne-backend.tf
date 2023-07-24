resource "azurerm_network_security_group" "nsg-ne-backend" {
  name                = "nsg-ne-backend"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "nsg-ne-backend-id" {
  value = azurerm_network_security_group.nsg-ne-backend.id
}
