variable "resource_group_name" {
  type        = string
  description = "Resource group to create the storage account in"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for the storage name; a random suffix is added for uniqueness"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply"
}