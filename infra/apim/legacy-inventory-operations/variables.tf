variable "api_name" {
  type        = string
  description = "The name of the API"
}


variable "api_management_name" {
  type        = string
  description = "The name of the API Management service"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "subscription_id" {
  type        = string
  description = "The ID of the subscription"
}
variable "operation_id" {
  type        = string
  description = "ID of the operation"
}

variable "operation_content_format" {
  type        = string
  description = "Content format of operation policy file"
}

variable "operation_policy_file_path" {
  type        = string
  description = "File path for the operation policy"
}

variable "resource_type" {
  type        = string
  description = "Resource type"
}