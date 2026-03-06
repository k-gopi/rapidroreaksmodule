resource "azurerm_private_dns_zone" "this" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {

  for_each = { for v in var.virtual_network_ids : v => v }

  name                  = "${var.project_name}-${var.environment}-dns-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = each.value
  registration_enabled  = true
}