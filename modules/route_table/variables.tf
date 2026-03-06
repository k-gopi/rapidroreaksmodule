variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

# List of subnets to associate with this route table
variable "subnets" {
  type = list(object({
    id   = string
    name = string
  }))
  default = []
}