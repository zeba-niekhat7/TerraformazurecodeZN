terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.57.0"
    }
  }
}
provider "azurerm" {
  alias = "resource"
  subscription_id = var.RESOURCE_ARM_SUBSCRIPTION_ID
  tenant_id       = var.RESOURCE_ARM_TENANT_ID
  client_id       = var.RESOURCE_ARM_CLIENT_ID
  client_secret   = var.RESOURCE_ARM_CLIENT_SECRET_ID
  features {}
}

provider "azurerm" {
  alias = "keyVault"
  subscription_id = var.KEYVAULT_ARM_SUBSCRIPTION_ID
  tenant_id       = var.KEYVAULT_ARM_TENANT_ID
  client_id       = var.KEYVAULT_ARM_CLIENT_ID
  client_secret   = var.KEYVAULT_ARM_CLIENT_SECRET_ID
  features {}
}
