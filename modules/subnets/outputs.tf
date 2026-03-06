output "subnet_ids" {
  description = "IDs of all subnets"
  value       = [for s in azurerm_subnet.this : s.id]
}

output "subnet_names" {
  description = "Names of all subnets"
  value       = [for s in azurerm_subnet.this : s.name]
}
output "subnets" {
  value       = azurerm_subnet.this
  description = "List of subnet objects"
}