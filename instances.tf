resource "azurerm_public_ip" "nidaleeippub" {
  name                = "nidalee-ip"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "nicfornidalee" {
  name                = "nidalee-nic"
  location            = azurerm_resource_group.katarina.location
  resource_group_name = azurerm_resource_group.katarina.name
  ip_configuration   { 
     name                            = "ipconfig1" 
     subnet_id                       = azurerm_subnet.publicSubnetLb.id 
     private_ip_address_allocation   = "Dynamic" 
     public_ip_address_id            = azurerm_public_ip.nidaleeippub.id
   }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nidaleeassnic" {
  network_interface_id      = azurerm_network_interface.nicfornidalee.id
  network_security_group_id =azurerm_network_security_group.katarina.id
}

# Create (and display) an SSH key
resource "tls_private_key" "kata_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "vmnidalee" {
  name                  = "nidalee-vm"
  location              = azurerm_resource_group.katarina.location
  resource_group_name   = azurerm_resource_group.katarina.name
  network_interface_ids = [azurerm_network_interface.nicfornidalee.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "finallyitshere"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.kata_key.public_key_openssh
  }
}