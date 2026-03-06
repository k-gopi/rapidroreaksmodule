resource "azurerm_firewall" "this" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.rg_name      # <-- correct argument
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  threat_intel_mode   = var.threat_intel_mode
  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = var.public_ip_id
  }
  tags = var.tags
}