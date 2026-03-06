resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}

# NSG rules
resource "azurerm_network_security_rule" "this" {
  for_each = { for r in var.nsg_rules : r.name => r }

  name                        = each.value.name
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.rg_name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
}