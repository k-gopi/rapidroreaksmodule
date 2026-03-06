output "sql_server_id" {
  value       = azurerm_mssql_server.this.id
  description = "The ID of the SQL Server"
}

output "sql_database_id" {
  value       = azurerm_mssql_database.this.id
  description = "The ID of the SQL Database"
}