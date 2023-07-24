resource "azurerm_network_security_rule" "ssh-from-isp" {
  resource_group_name         = azurerm_network_security_group.nsg-we-home.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg-we-home.name
  name                        = "ssh-from-isp"
  description                 = <<-EOT
    Allow SSH traffic only from ISP network.
    Two ranges from the ISP have been provided.
  EOT
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefixes     = ["94.227.0.0/16", "84.197.0.0/16"]
  destination_address_prefix  = "*"
}
