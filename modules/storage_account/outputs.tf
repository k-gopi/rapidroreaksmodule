output "storage_account_id" {
  description = "Storage Account ID"
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Storage Account Name"
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary Blob Endpoint"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_access_key" {
  description = "Primary Access Key"
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}