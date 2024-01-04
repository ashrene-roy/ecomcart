resource "azurerm_api_management_named_value" "named_value" {
  name                = var.named_value.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  display_name        = var.named_value.display_name
  value               = var.named_value.value
}