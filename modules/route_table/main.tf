resource "azurerm_route_table" "this" {
  name                = var.route_table_name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

# Optional: associate route table with subnets
# Check if subnets variable is not empty
locals {
  has_subnets = length(var.subnets) > 0
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = local.has_subnets ? { for s in var.subnets : s.name => s } : {}

  subnet_id      = each.value.id
  route_table_id = azurerm_route_table.this.id
}