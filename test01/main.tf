module "resource_groups_map" {
  source      = "./rg-module"
  for_each    = local.resource_groups_map
  application = each.value.application
  location    = each.value.location
  environment = each.value.environment
  sequence    = can(each.value.sequence) ? each.value.sequence : null
  spn_reader = {
    enabled = true
  }
  tags = can(each.value.tags) ? each.value.tags : null
}

module "resource_groups_list" {
  source      = "./rg-module"
  count       = length(local.resource_groups_list)
  application = local.resource_groups_list[count.index].application
  location    = local.resource_groups_list[count.index].location
  environment = local.resource_groups_list[count.index].environment
  sequence    = local.resource_groups_list[count.index].sequence
  spn_reader = {
    enabled = true
    spn_id  = "cbdc84cd-3e0c-46b4-8ef6-adafc47097d8"
  }
}

output "rg-names1-list" {
  value = [
    for rg in module.resource_groups_map : rg.rg-name
  ]
}

output "rg-names1-map" {
  value = {
    for key, rg in module.resource_groups_map : key => rg.rg-name
  }
}

output "rg-names2-list" {
  value = [
    for rg in module.resource_groups_list : rg.rg-name
  ]
}

output "rg-names2-map" {
  value = {
    for key, rg in module.resource_groups_list : key => rg.rg-name
  }
}
