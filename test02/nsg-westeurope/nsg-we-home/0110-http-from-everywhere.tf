resource "azurerm_network_security_rule" "http-from-everywhere" {
  resource_group_name         = azurerm_network_security_group.nsg-we-home.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg-we-home.name
  name                        = "http-from-everywhere"
  priority                    = 110
  direction                   = "Inbound"
  description                 = <<-EOT
    Allow HTTP and HTTPS traffic from everywhere.
  EOT
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges = [
    "80",
    "443",
  ]
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
