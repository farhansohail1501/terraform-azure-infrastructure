variable "resource_group_id" {
  type        = string
  description = "Resource group to apply the policy to"
}

variable "allowed_locations" {
  type    = list(string)
  default = ["australiaeast"]
}