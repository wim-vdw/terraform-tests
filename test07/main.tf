resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "rg-${local.suffix}"
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-${local.suffix}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vn-${local.suffix}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.253.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "sn-${local.suffix}-default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.253.0.0/25"]
}

resource "azurerm_network_security_group" "default" {
  name                = "nsg-${local.suffix}-default"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "ssh-from-home" {
  resource_group_name         = azurerm_network_security_group.default.resource_group_name
  network_security_group_name = azurerm_network_security_group.default.name
  name                        = "ssh-from-home"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.home_ip
  destination_address_prefix  = "*"
}

resource "azurerm_subnet_network_security_group_association" "home" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.default.id
}

resource "azurerm_network_interface" "vm1" {
  name                = "nic-${local.suffix}-vm1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "vm-${local.suffix}-01"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_B1s"
  admin_username                  = "wim"
  disable_password_authentication = true
  custom_data                     = filebase64("init.sh")
  network_interface_ids = [
    azurerm_network_interface.vm1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    name                 = "vm-${local.suffix}-01-os-disk"
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "wim"
    public_key = var.public_key
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_managed_disk" "managed_disk" {
  for_each = local.data_disks

  name                 = join("", [azurerm_linux_virtual_machine.vm1.name, "-datadisk", format("%02s", each.key)])
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = each.value.size
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk-attachment" {
  for_each = local.data_disks

  managed_disk_id    = azurerm_managed_disk.managed_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm1.id
  lun                = each.key
  caching            = each.value.caching
}

output "ip" {
  value = azurerm_public_ip.pip.ip_address
}
