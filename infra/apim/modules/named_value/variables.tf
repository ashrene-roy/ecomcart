variable "api_management_name" {
  type        = string
  description = "The name of the API Management service"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "named_value" {
  type = object({
    name         = string
    display_name = string
    value        = string
  })
  description = "Named value parameters for the API management service"
}
