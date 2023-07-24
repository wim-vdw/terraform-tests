resource "azurerm_network_security_group" "nsg-we-home" {
  name                = "nsg-we-home"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "nsg-we-home-id" {
  value = azurerm_network_security_group.nsg-we-home.id
}
