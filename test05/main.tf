resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test05"
}

module "dashboard" {
  source  = "app.terraform.io/wimvandenwyngaert/dashboard/azurerm"
  version = ">= 1.0.0, < 2.0.0"

  location       = azurerm_resource_group.rg.location
  resource_group = azurerm_resource_group.rg.name
  name           = "sd-test-01"
  title          = "Test dashboard created via Terraform module"
  dashboard_properties = templatefile("templates/dashboard_template.json", {
    timezone = "Romance Standard Time",
    format   = "HH:mm"
  })
}
