resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test04"
}

resource "azurerm_portal_dashboard" "dashboard1" {
  name                = "dashboard1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    hidden-title = "Dashboard1 long name"
  }
  dashboard_properties = <<DASH
{
  "lenses": {}
}
DASH
}

resource "azurerm_portal_dashboard" "dashboard2" {
  name                = "dashboard2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    hidden-title = "Dashboard2 long name"
  }
  dashboard_properties = <<DASH
{
  "lenses": {}
}

DASH

  lifecycle {
    ignore_changes = [dashboard_properties]
  }
}
