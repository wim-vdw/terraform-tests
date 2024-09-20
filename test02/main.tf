resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-${local.suffix}"
  tags = {
    managed-by = "Terraform"
  }
}

resource "azurerm_virtual_network" "vnet-01" {
  name                = "vn-${local.suffix}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "northeurope"
  address_space       = ["10.255.0.0/16"]
}

resource "azurerm_virtual_network" "vnet-02" {
  name                = "vn-${local.suffix}-02"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
  address_space       = ["10.254.0.0/16"]
}

resource "azurerm_virtual_network_peering" "peering1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet-01.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-02.id
}

resource "azurerm_virtual_network_peering" "peering2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet-02.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-01.id
}

resource "azurerm_subnet" "bastion" {
  name                              = "sn-${local.suffix}-bastion"
  resource_group_name               = azurerm_resource_group.rg.name
  virtual_network_name              = azurerm_virtual_network.vnet-01.name
  private_endpoint_network_policies = "Enabled"
  address_prefixes                  = ["10.255.0.0/28"]
}

resource "azurerm_subnet" "frontend" {
  name                                          = "sn-${local.suffix}-frontend"
  resource_group_name                           = azurerm_resource_group.rg.name
  virtual_network_name                          = azurerm_virtual_network.vnet-01.name
  private_endpoint_network_policies             = "RouteTableEnabled"
  private_link_service_network_policies_enabled = true
  address_prefixes                              = ["10.255.1.0/24"]
}

resource "azurerm_subnet" "backend" {
  name                                          = "sn-${local.suffix}-backend"
  resource_group_name                           = azurerm_resource_group.rg.name
  virtual_network_name                          = azurerm_virtual_network.vnet-01.name
  private_endpoint_network_policies             = "NetworkSecurityGroupEnabled"
  private_link_service_network_policies_enabled = false
  address_prefixes                              = ["10.255.2.0/24"]
}

resource "azurerm_subnet" "home" {
  name                 = "sn-${local.suffix}-home"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-02.name
  address_prefixes     = ["10.254.0.0/24"]
}

module "nsg-westeurope" {
  source              = "./nsg-westeurope"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
}

module "nsg-northeurope" {
  source              = "./nsg-northeurope"
  location            = "northeurope"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg-ne-bastion" {
  subnet_id                 = azurerm_subnet.bastion.id
  network_security_group_id = module.nsg-northeurope.nsg-ne-bastion-id
}

resource "azurerm_subnet_network_security_group_association" "nsg-ne-frontend" {
  subnet_id                 = azurerm_subnet.frontend.id
  network_security_group_id = module.nsg-northeurope.nsg-ne-frontend-id
}

resource "azurerm_subnet_network_security_group_association" "nsg-ne-backend" {
  subnet_id                 = azurerm_subnet.backend.id
  network_security_group_id = module.nsg-northeurope.nsg-ne-backend-id
}

resource "azurerm_subnet_network_security_group_association" "nsg-we-home" {
  subnet_id                 = azurerm_subnet.home.id
  network_security_group_id = module.nsg-westeurope.nsg-we-home-id
}
