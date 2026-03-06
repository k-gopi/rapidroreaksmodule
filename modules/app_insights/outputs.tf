output "app_insights_id" {
  value       = azurerm_application_insights.this.id
  description = "Application Insights ID"
}

output "app_insights_instrumentation_key" {
  value       = azurerm_application_insights.this.instrumentation_key
  description = "Instrumentation key"
}