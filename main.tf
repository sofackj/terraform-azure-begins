terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "4c32742e-212c-4c73-be5d-6f1a024532e8"
  client_id       = "cd39ec4b-9c96-4e80-8007-6e5855eaa22f"
  client_secret   = var.client_secret
  tenant_id       = "06d06b36-bd7b-4c67-b2d3-304925275c5f"
}
