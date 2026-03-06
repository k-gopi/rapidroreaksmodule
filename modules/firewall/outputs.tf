output "firewall_id" {
  value       = azurerm_firewall.this.id
  description = "ID of the Azure Firewall"
}

output "firewall_name" {
  value       = azurerm_firewall.this.name
  description = "Name of the Azure Firewall"
}