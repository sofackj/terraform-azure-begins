# Create a security group for futur VMs
resource "azurerm_network_security_group" "katarina" {
  name                = "katarina-security-group"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  security_rule {
    name                       = "SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create public IPs
resource "azurerm_public_ip" "katarina_public_ip" {
  name                = "katarinaPublicIP"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  allocation_method   = "Dynamic"
}

