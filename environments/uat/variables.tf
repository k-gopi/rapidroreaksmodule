# Project-level variables
variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

# VNet variables
variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type    = list(string)
  default = []
}

# Subnets variables
variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}