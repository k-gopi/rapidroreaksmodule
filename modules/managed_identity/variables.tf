variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "identity_name" {
  description = "Managed Identity Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
}