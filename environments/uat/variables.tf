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

# NSG variables
variable "nsg_name" {
  type = string
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}

# Route Table
variable "route_table_name" {
  type = string
}

# Private DNS
variable "private_dns_zone_name" {
  type = string
}

variable "virtual_network_ids" {
  type    = list(string)
  default = []
}

# Log Analytics
variable "workspace_name" {
  type = string
}

# Storage
variable "storage_account_name" {
  type = string
}

# Managed Identity
variable "identity_name" {
  type = string
}

# ACR
variable "acr_name" {
  type = string
}

# KeyVault
variable "kv_name" {
  type = string
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

variable "object_id" {
  type      = string
  sensitive = true
}

# SQL Server
variable "sql_server_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

# Application Insights
variable "app_insights_name" {
  type = string
}

# Firewall
variable "network_rules" {
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