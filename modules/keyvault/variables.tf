variable "kv_name" {
  type        = string
  description = "Key Vault name"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID (from env var TF_VAR_tenant_id)"
}

variable "object_id" {
  type        = string
  description = "Object ID of the principal (from env var TF_VAR_object_id)"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}