resource "azurerm_api_management_api" "api" {
  name                = var.api.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = var.api.revision
  display_name        = var.api.display_name
  path                = var.api.path
  protocols           = ["https"]

  import {
    content_format = var.api.content_format
    content_value  = file("${var.api.content_value}")
  }
}