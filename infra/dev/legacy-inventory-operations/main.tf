terraform {
  required_version = ">=1.6"
  backend "azurerm" {
    resource_group_name  = "ecomcart"
    storage_account_name = "ecomcartstoragedev"
    container_name       = "terraform-backend"
    key                  = "getproductmetadatbyid-operation.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "=1.11.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azapi_update_resource" "resource" {
  type = var.resource_type
  body = jsonencode({
    properties : {
      format : var.operation_content_format,
      value : file(var.operation_policy_file_path)
    }
  })
  parent_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ApiManagement/service/${var.api_management_name}/apis/${var.api_name}/operations/${var.operation_id}"
  name      = "policy"
}