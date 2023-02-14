resource "azurerm_container_group" "poppy" {
  name                = "docker-in-runeterra"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  ip_address_type     = "Public"
  os_type             = "Linux"

  container {
    name   = "kawaii"
    image  = "nginx:alpine-slim"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "runeterra"
  }
}