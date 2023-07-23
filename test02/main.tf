resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-${local.suffix}"
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
  name                 = "sn-${local.suffix}-bastion"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["10.255.0.0/25"]
}

resource "azurerm_subnet" "gateway" {
  name                 = "sn-${local.suffix}-gateway"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["10.255.0.128/26"]
}

resource "azurerm_subnet" "frontend" {
  name                 = "sn-${local.suffix}-frontend"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["10.255.1.0/24"]
}

resource "azurerm_subnet" "backend" {
  name                 = "sn-${local.suffix}-backend"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["10.255.2.0/24"]
}

resource "azurerm_subnet" "home" {
  name                 = "sn-${local.suffix}-home"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-02.name
  address_prefixes     = ["10.254.0.0/24"]
}

resource "azurerm_network_security_group" "home" {
  name                = "nsg-home"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "home" {
  subnet_id                 = azurerm_subnet.home.id
  network_security_group_id = azurerm_network_security_group.home.id
}
