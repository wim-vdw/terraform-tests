resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = local.resource-group-name
  tags = merge(
    var.tags,
    { author = "Wim Van den Wyngaert" }
  )

  lifecycle {
    ignore_changes = [tags["ignoreTag"]]
  }
}

resource "azurerm_role_assignment" "spn_reader" {
  count = var.spn_reader.enabled ? 1 : 0

  principal_id         = coalesce(var.spn_reader.spn_id, local.default_spn_id)
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
}

output "rg-name" {
  value = azurerm_resource_group.rg.name
}
