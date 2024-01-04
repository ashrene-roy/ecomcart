terraform {
  required_version = ">=1.6"
  backend "azurerm" {
    resource_group_name  = "ecomcart"
    storage_account_name = "ecomcartstoragedev"
    container_name       = "terraform-backend"
    key                  = "actions.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}
provider "azurerm" {
  features {}
}

module "operation_policy" {
  source = "../modules/operation_policy"
  api = {
    name                = var.api_name
  }
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  operation = {
    id                = var.operation_id
    policy_file_path  = var.operation_policy_file_path
  }
}
