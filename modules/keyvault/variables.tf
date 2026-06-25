variable "resource_group_name" {
  type        = string
  description = "Resource group for the Key Vault"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for the vault name; random suffix added for uniqueness"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply"
}