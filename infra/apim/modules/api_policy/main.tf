resource "azurerm_api_management_api_policy" "api_policy" {
  api_name            = var.api.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name

  xml_content = file("${var.api.policy_file_path}")
}
