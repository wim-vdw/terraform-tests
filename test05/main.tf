resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test05"
  tags = {
    author     = "Wim Van den Wyngaert"
    managed-by = "Terraform"
  }
}

module "dashboard" {
  source  = "app.terraform.io/wimvandenwyngaert/dashboard/azurerm"
  version = ">= 1.0.0, < 2.0.0"

  location       = azurerm_resource_group.rg.location
  resource_group = azurerm_resource_group.rg.name
  name           = "sd-test-01"
  title          = "Created via Terraform module"
  dashboard_properties = templatefile("templates/dashboard_template.json", {
    timezone = "Romance Standard Time",
    format   = "HH:mm"
  })
}
