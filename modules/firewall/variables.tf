variable "firewall_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "sku_tier" {
  type = string
}

variable "threat_intel_mode" {
  type = string
}

variable "firewall_subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "network_rules" {
  description = "List of network rules for firewall"
  type = list(object({
    name                  = string
    priority              = number
    action                = string
    rule_name             = string
    protocols             = list(string)
    source_addresses      = list(string)
    destination_addresses = list(string)
    destination_ports     = list(string)
  }))
  default = []
}

variable "application_rules" {
  description = "List of application rules for firewall"
  type = list(object({
    name             = string
    priority         = number
    action           = string
    rule_name        = string
    protocol         = string
    protocol_port    = number
    source_addresses = list(string)
    target_fqdns     = list(string)
  }))
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}