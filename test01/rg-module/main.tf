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

output "rg-name" {
  value = azurerm_resource_group.rg.name
}
