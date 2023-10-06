resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-test10"
}

resource "azurerm_maintenance_configuration" "test" {
  location                 = azurerm_resource_group.rg.location
  name                     = "mc-test10"
  resource_group_name      = azurerm_resource_group.rg.name
  scope                    = "InGuestPatch"
  in_guest_user_patch_mode = "User"

  window {
    start_date_time = "2023-10-15 12:30"
    time_zone       = "Romance Standard Time"
    duration        = "02:00"
    recur_every     = "1Month day1"
  }

  install_patches {
    reboot = "Never"

    linux {
      classifications_to_include = ["Critical", "Security"]
    }
  }
}
