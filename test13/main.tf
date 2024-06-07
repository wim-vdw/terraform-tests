resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test13"
}

resource "azurerm_service_plan" "asp" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "asp-test-01"
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "app" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "app-wvdw-001"
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on        = false
    app_command_line = "gunicorn --bind=0.0.0.0 \"myapp:create_app()\""

    application_stack {
      python_version = "3.12"
    }
  }
}
