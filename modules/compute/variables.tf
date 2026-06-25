variable "resource_group_name" { 
type = string 
}

variable "location"            {
 type = string 
 }

variable "subnet_id" {
  type        = string
  description = "The subnet to place the VM in"
}
variable "vm_name" { 
type = string 
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "The VM size"
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type    = map(string)
  default = {}
}