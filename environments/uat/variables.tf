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

# -----------------------------
# NSG
# -----------------------------
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

# -----------------------------
# Route Table
# -----------------------------
variable "route_table_name" {
  type = string
}
# -----------------------------
# private_dns
# -----------------------------
variable "private_dns_zone_name" {
  type = string
}

variable "virtual_network_ids" {
  type    = list(string)
  default = []
}

variable "workspace_name" {
  type = string
}
variable "storage_account_name" {
  type = string
}
variable "identity_name" {
  type = string
}

variable "acr_name" {
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
variable "kv_name" {
  description = "Name of the Key Vault"
  type        = string
}
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