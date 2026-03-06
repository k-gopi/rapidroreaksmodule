variable "resource_group_name" {
  description = "Resource group where subnets will be created"
  type        = string
}

variable "location" {
  description = "Azure location for the subnets"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "subnets" {
  description = "List of subnets with name and address prefix"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "tags" {
  description = "Tags to apply to subnets"
  type        = map(string)
}