terraform {
  required_version = ">=1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.2"
    }
  }
}
provider "azurerm" {
  features {}
}

module "storage_account" {
  source                   = "../modules/storage_account"
  resource_group_name      = var.resource_group_name
  storage_account_location = var.storage_account_location
  storage_account_name     = var.storage_account_name
}

module "storage_container" {
  source                 = "../modules/storage_container"
  depends_on             = [module.storage_account]
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}
