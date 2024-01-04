variable "api" {
  type = object({
    name            = string
    revision        = string
    display_name    = string
    path            = string
    content_format  = string
    content_value   = string
  })
  description = "Information about the API"
}

variable "api_management_name" {
  type        = string
  description = "The name of the API Management service"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
