resource "azurerm_application_insights" "this" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.rg_name
  application_type = "web"

  workspace_id = var.workspace_id

  tags = var.tags
}