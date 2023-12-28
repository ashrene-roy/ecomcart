resource "azurerm_storage_container" "storage_container" {
  name = var.storage_container_name
  storage_account_name = var.storage_account_name
}