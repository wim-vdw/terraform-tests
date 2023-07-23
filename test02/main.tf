resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-${local.suffix}"
}

resource "azurerm_virtual_network" "vnet-01" {
  name                = "vn-${local.suffix}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "northeurope"
  address_space       = ["99.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet-02" {
  name                = "vn-${local.suffix}-02"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
  address_space       = ["100.0.0.0/16"]
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
  name                 = "sn-${local.suffix}-bastion"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["99.0.0.0/25"]
}

resource "azurerm_subnet" "gateway" {
  name                 = "sn-${local.suffix}-gateway"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["99.0.0.128/26"]
}

resource "azurerm_subnet" "frontend" {
  name                 = "sn-${local.suffix}-frontend"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["99.0.1.0/24"]
}

resource "azurerm_subnet" "backend" {
  name                 = "sn-${local.suffix}-backend"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["99.0.2.0/24"]
}

resource "azurerm_subnet" "home" {
  name                 = "sn-${local.suffix}-home"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-02.name
  address_prefixes     = ["100.0.0.0/24"]
}
