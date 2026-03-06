output "acr_id" {
  description = "ACR Resource ID"
  value       = azurerm_container_registry.this.id
}

output "acr_name" {
  description = "ACR Name"
  value       = azurerm_container_registry.this.name
}

output "acr_login_server" {
  description = "ACR Login Server"
  value       = azurerm_container_registry.this.login_server
}