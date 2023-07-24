module "nsg-ne-bastion" {
  source              = "./nsg-ne-bastion"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "nsg-ne-frontend" {
  source              = "./nsg-ne-frontend"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "nsg-ne-backend" {
  source              = "./nsg-ne-backend"
  location            = var.location
  resource_group_name = var.resource_group_name
}
