resource "azurerm_api_management_api_operation_policy" "operation_policy" {
  api_name            = var.api.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  operation_id        = var.operation.id

  xml_content = file("${var.operation.policy_file_path}")

}