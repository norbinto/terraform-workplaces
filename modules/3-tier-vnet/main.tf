resource "azurerm_virtual_network" "main" {
  name                = "vnet-one"
  resource_group_name = var.group
  location            = var.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "api" {
  name                 = "subnet-api"
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.apisubnet
}


resource "azurerm_subnet" "data" {
  name                 = "subnet-data"
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.datasubnet
}