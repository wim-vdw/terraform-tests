resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test05"
  tags = {
    author     = "Wim Van den Wyngaert"
    managed-by = "Terraform Cloud"
    env        = "dev"
    tag1       = "value1"
    tag2       = "value2"
  }
}

module "dashboard" {
  source  = "app.terraform.io/wimvandenwyngaert/dashboard/azurerm"
  version = ">= 4.0.0, < 5.0.0"

  location       = azurerm_resource_group.rg.location
  resource_group = azurerm_resource_group.rg
  name           = "sd-test-05"
  title          = "Created via Terraform Cloud"
  additional_tags = {
    type = "Test dashboard"
  }
  dashboard_properties = templatefile("templates/dashboard_template.json", {
    timezone = "Romance Standard Time",
    format   = "HH:mm"
  })
}

output "dashboard_id" {
  value = module.dashboard.id
}
