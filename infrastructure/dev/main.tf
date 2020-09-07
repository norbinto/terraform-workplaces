# Create a RG
resource "azurerm_resource_group" "main" {
  name     = "rg-tf-${terraform.workspace}"
  location = "West Europe"
}

module "vnet" {
    source = "../../modules/3-tier-vnet"
    group = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
    address_space = ["10.0.0.0/16"]
    apisubnet= ["10.0.1.0/24"]
    datasubnet = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "extra" {
  name                 = "thirdsubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = ["10.0.3.0/24"]
}