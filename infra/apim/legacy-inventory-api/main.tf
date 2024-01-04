terraform {
  required_version = ">=1.3"
  backend "azurerm" {
    resource_group_name  = "ecomcart"
    storage_account_name = "ecomcartstoragedev"
    container_name       = "terraform-backend"
    key                  = "actions.tfstate"
  }
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

module "api" {
  source = "../modules/api"
  api = {
    name           = var.api_name
    revision       = var.api_revision
    display_name   = var.api_display_name
    path           = var.api_path
    content_format = var.api_content_format
    content_value  = var.api_content_value
  }
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
}

module "named_value_1" {
  source              = "../modules/named_value"
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  named_value = {
    name         = var.named_value_name_1
    display_name = var.named_value_display_name_1
    value        = var.named_value_value_1
  }
}

module "named_value_2" {
  source              = "../modules/named_value"
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  named_value = {
    name         = var.named_value_name_2
    display_name = var.named_value_display_name_2
    value        = var.named_value_value_2
  }
}

module "api_policy" {
  source     = "../modules/api_policy"
  depends_on = [module.api, module.named_value_1, module.named_value_2]
  api = {
    name             = var.api_name
    policy_file_path = var.api_policy_file_path
    revision         = var.api_revision
    display_name     = var.api_display_name
    path             = var.api_path
    content_format   = var.api_content_format
    content_value    = var.api_content_value
  }
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
}

