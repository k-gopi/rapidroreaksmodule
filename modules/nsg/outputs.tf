output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.this.id
}

output "nsg_name" {
  description = "Name of the Network Security Group"
  value       = azurerm_network_security_group.this.name
}

output "nsg_rule_ids" {
  description = "IDs of all NSG rules"
  value       = [for r in azurerm_network_security_rule.this : r.id]
}