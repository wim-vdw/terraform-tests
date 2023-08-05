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
  "lenses": {
      "0": {
        "order": 0,
        "parts": {
          "0": {
            "position": {
              "x": 0,
              "y": 0,
              "colSpan": 2,
              "rowSpan": 2
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/ClockPart",
              "settings": {
                "content": {
                  "timezoneId": "Romance Standard Time",
                  "timeFormat": "HH:mm",
                  "version": 1
                }
              }
            }
          }
        }
      }
    },
    "metadata": {
      "model": {
        "timeRange": {
          "value": {
            "relative": {
              "duration": 24,
              "timeUnit": 1
            }
          },
          "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
        }
      }
    }
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
