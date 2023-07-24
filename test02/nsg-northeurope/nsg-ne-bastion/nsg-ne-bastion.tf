resource "azurerm_network_security_group" "nsg-ne-bastion" {
  name                = "nsg-ne-bastion"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "nsg-ne-bastion-id" {
  value = azurerm_network_security_group.nsg-ne-bastion.id
}
