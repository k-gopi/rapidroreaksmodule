resource "azurerm_container_registry" "this" {

  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location

  sku           = "Standard"
  admin_enabled = false

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {

  principal_id         = var.identity_principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.this.id
}