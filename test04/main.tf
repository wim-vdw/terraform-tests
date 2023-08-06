resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test04"
}

resource "azurerm_portal_dashboard" "dashboard1" {
  name                = "dashboard1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dashboard_properties = templatefile("templates/dashboard1.json", {
    timezone = "Romance Standard Time",
    format   = "HH:mm"
  })
  tags = {
    hidden-title = "Dashboard1 user-friendly title"
  }
}

resource "azurerm_portal_dashboard" "dashboard2" {
  name                = "dashboard2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    hidden-title = "Dashboard2 user-friendly title"
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

resource "azurerm_portal_dashboard" "dashboard3" {
  name                 = "dashboard3"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  dashboard_properties = <<DASH
{
  "lenses": {}
}
DASH

  lifecycle {
    ignore_changes = [dashboard_properties]
  }
}
