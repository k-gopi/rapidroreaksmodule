resource "azurerm_route_table" "this" {
  name                = var.route_table_name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

# Default route to Internet for firewall subnet (must be before association)
resource "azurerm_route" "default_internet" {
  count               = contains([for s in var.subnets : s.name], "AzureFirewallSubnet") ? 1 : 0
  name                = "Default-Route-Internet"
  resource_group_name = var.rg_name
  route_table_name    = azurerm_route_table.this.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

# Optional: associate route table with subnets
locals {
  has_subnets = length(var.subnets) > 0
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = local.has_subnets ? { for s in var.subnets : s.name => s } : {}

  subnet_id      = each.value.id
  route_table_id = azurerm_route_table.this.id

  # depends_on ensures default route exists before attaching
  depends_on = [azurerm_route.default_internet]
}