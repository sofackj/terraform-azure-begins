resource "azurerm_resource_group" "katarina" {
  name     = "katarina-resources"
  location = "West Europe"
}

# Create a virtual network or vpc
resource "azurerm_virtual_network" "katarina" {
  name                = "katarina-network"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  address_space       = ["13.78.128.0/22"]
  tags = {
    environment = "Runeterra"
  }
}

# Create 2 subnets
resource "azurerm_subnet" "publicSubnetLb" {
  name                 = "leblanc-subnet"
  resource_group_name  = azurerm_resource_group.katarina.name
  virtual_network_name = azurerm_virtual_network.katarina.name
  address_prefixes     = ["13.78.129.0/24"]
}

resource "azurerm_subnet" "publicSubnetMf" {
  name                 = "missfortune-subnet"
  resource_group_name  = azurerm_resource_group.katarina.name
  virtual_network_name = azurerm_virtual_network.katarina.name
  address_prefixes     = ["13.78.130.0/24"]
}