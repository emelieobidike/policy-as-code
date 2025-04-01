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
  tenant_id       = "c6b24d18-bbd0-4aec-b84c-e791e95a76e3"
  subscription_id = "b077fa7f-3020-4dee-8fbb-bf0007bc2dad"
  client_id       = "4870cf44-5441-4652-a1d6-8e8ae157b2ce"
  client_secret   = "Fqe8Q~gRCrOEmZKDth4W7LGab.lUSMs5xuVthcFL"
}