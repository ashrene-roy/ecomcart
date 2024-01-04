variable "api" {
  type = object({
    name             = string
    policy_file_path = string
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
