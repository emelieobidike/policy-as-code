terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
  tenant_id       = "xxx"
  subscription_id = "xxx"
  client_id       = "xxx"
  client_secret   = "xxx"
}