data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test06"
}

#resource "azurerm_key_vault" "kv" {
#  location                  = azurerm_resource_group.rg.location
#  resource_group_name       = azurerm_resource_group.rg.name
#  name                      = "kv-test06-vdww"
#  sku_name                  = "standard"
#  tenant_id                 = data.azurerm_client_config.current.tenant_id
#  purge_protection_enabled  = false
#  enable_rbac_authorization = true
#}
