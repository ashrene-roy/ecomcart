resource "azurerm_storage_account" "storage_account" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.storage_account_location
  account_kind = "StorageV2"
  account_tier = "Standard"
  access_tier = "Hot"
  account_replication_type = "ZRS"
  enable_https_traffic_only = true
   
  lifecycle {
    prevent_destroy = true
  }
}