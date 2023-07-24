module "nsg-we-home" {
  source              = "./nsg-we-home"
  location            = var.location
  resource_group_name = var.resource_group_name
}
