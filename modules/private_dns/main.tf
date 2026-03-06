/*resource "azurerm_private_dns_zone" "this" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  count                 = length(var.virtual_network_ids)
  name                  = "${var.project_name}-${var.environment}-dns-link-${count.index}"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.virtual_network_ids[count.index]
  registration_enabled  = true
}
*/

resource "azurerm_private_dns_zone" "this" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {

  count = length(var.virtual_network_ids)

  name                  = "${var.project_name}-${var.environment}-dns-link-${count.index}"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.virtual_network_ids[count.index]

  registration_enabled = false

  depends_on = [
    azurerm_private_dns_zone.this
  ]
}