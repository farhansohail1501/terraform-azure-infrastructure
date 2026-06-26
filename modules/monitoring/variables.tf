variable "resource_group_name" { type = string }
variable "vm_id"               { type = string }
variable "alert_email"         { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}