variables {
  rg-name     = "rg-test09"
  rg-location = "northeurope"
}

run "validate_new_rg" {
  command = apply

  assert {
    condition     = azurerm_resource_group.rg.name == "rg-test09"
    error_message = "Resource group name is different from rg-test09"
  }

  assert {
    condition     = azurerm_resource_group.rg.location == "northeurope"
    error_message = "Resource group location is different from northeurope"
  }
}

run "validate_name" {
  command = plan

  assert {
    condition     = var.first_name == "Wim"
    error_message = "First name must be Wim"
  }

  assert {
    condition     = var.last_name == "Van den Wyngaert"
    error_message = "Last name must be Van den Wyngaert"
  }
}
