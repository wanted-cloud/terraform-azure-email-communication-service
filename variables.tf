variable "name" {
  description = "Name of the Azure Keyvault."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the Azure Keyvault will be created."
  type        = string
}

variable "data_location" {
  description = "Location of the data for the Azure Communication Service."
  type        = string
  default     = "Europe"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "service_domains" {
  description = "List of service domains to be used for the Azure Communication Service."
  type = list(object({
    name                             = string
    domain_management                = string
    user_engagement_tracking_enabled = optional(bool, false)
    tags                             = optional(map(string), {})
    sender_usernames = optional(list(object({
      display_name = optional(string, "")
      name         = string
    })), [])
  }))
  default = []
}