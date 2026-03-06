variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "private_dns_zone_name" {
  type = string
}

variable "virtual_network_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}