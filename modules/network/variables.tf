variable "resource_group_name" {
  type        = string
  description = "Which resource group to build in"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the network resources"
}