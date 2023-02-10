resource "azurerm_resource_group" "katarina" {
  name     = "katarina-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "katarina" {
  name                = "katarina-security-group"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
}

# Create a virtual network or vpc
resource "azurerm_virtual_network" "katarina" {
  name                = "katarina-network"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  address_space       = ["13.78.128.0/22"]
  tags = {
    environment = "Production"
  }
}

# Create subnet
resource "azurerm_subnet" "publicSubnetOne" {
  name                 = "first-subnet"
  resource_group_name  = azurerm_resource_group.katarina.name
  virtual_network_name = azurerm_virtual_network.katarina.name
  address_prefixes     = ["13.78.129.0/24"]
}