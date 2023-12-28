variable "api" {
  type = object({
    name            = string
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

variable "operation" {
  type = object({
    id                = string
    policy_file_path  = string
  })
  description = "Operation details for the API management service"
}
