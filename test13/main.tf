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

resource "azurerm_linux_web_app" "app-wvdw-001" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "app-wvdw-001"
  service_plan_id     = azurerm_service_plan.asp.id

  logs {
    detailed_error_messages = false
    failed_request_tracing  = false

    http_logs {

      file_system {
        retention_in_days = 30
        retention_in_mb   = 35
      }
    }
  }

  site_config {
    always_on        = false
    app_command_line = "gunicorn --bind=0.0.0.0 \"myapp:create_app()\" --access-logfile '-' --error-logfile '-'"

    application_stack {
      python_version = "3.12"
    }

    cors {
      allowed_origins = ["https://vdww.duckdns.org"]
    }
  }
}

resource "azurerm_linux_web_app" "app-wvdw-002" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "app-wvdw-002"
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = false
  }
}
