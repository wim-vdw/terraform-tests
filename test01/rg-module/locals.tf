locals {
  environment_lower       = lower(var.environment)
  location_lower_stripped = replace(lower(var.location), " ", "")
  sequence                = var.sequence == null ? 1 : var.sequence
  environment_short = {
    development = "dev"
    production  = "prd"
  }
  location_short = {
    northeurope = "ne"
    westeurope  = "we"
  }
  resource-group-name = join("-", [
    "rg",
    local.location_short[local.location_lower_stripped],
    local.environment_short[local.environment_lower],
    var.application,
    format("%02s", local.sequence)
    ]
  )
}
