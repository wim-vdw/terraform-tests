data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test06"
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault" "kv" {
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  name                       = "kv-test06-vdww-01-rbac"
  sku_name                   = "standard"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = false
  soft_delete_retention_days = 7
  enable_rbac_authorization  = true
}

resource "random_password" "pwd1" {
  length           = 20
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "(){};&"
}

resource "azurerm_key_vault_secret" "user1" {
  name         = "user1"
  value        = random_password.pwd1.result
  key_vault_id = azurerm_key_vault.kv.id
}

resource "random_password" "pwd2" {
  length           = 20
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "(){};&"
}

resource "azurerm_key_vault_secret" "user2" {
  name         = "user2"
  value        = random_password.pwd2.result
  key_vault_id = azurerm_key_vault.kv.id
}
