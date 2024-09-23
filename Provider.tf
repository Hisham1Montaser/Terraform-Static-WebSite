terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e43ccb45-8ab5-48fe-b42b-1ecd47ed0f76"
  tenant_id       = "3da777c4-735a-4f58-976d-377cf571b4ff"
  client_id       = "4a1ef722-16be-4c7a-afc0-5f51dda09137"
}