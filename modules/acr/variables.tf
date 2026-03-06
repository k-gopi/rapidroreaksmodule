variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "identity_principal_id" {
  description = "Managed Identity principal id"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}