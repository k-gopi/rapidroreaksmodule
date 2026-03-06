output "keyvault_id" {
  value       = azurerm_key_vault.this.id
  description = "Key Vault resource ID"
}

output "keyvault_name" {
  value       = azurerm_key_vault.this.name
  description = "Key Vault name"
}

output "keyvault_uri" {
  value       = azurerm_key_vault.this.vault_uri
  description = "Key Vault URI"
}