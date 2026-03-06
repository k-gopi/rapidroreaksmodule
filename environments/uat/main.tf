# Resource Group
module "resource_group" {
  source       = "../../modules/resource_group"
  rg_name      = var.rg_name
  location     = var.location
  project_name = var.project_name
  environment  = var.environment
  tags         = var.tags
}

# Virtual Network
module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg_name
  tags                = var.tags
}

# Subnets
module "subnets" {
  source              = "../../modules/subnets"
  resource_group_name = module.resource_group.rg_name
  location            = module.resource_group.location
  vnet_name           = module.vnet.vnet_name
  subnets             = var.subnets
  tags                = var.tags
}

# Network Security Group
module "nsg" {
  source       = "../../modules/nsg"
  project_name = var.project_name
  environment  = var.environment
  nsg_name     = var.nsg_name
  nsg_rules    = var.nsg_rules
  location     = module.resource_group.location
  rg_name      = module.resource_group.rg_name
  tags         = var.tags
}

# Route Table
module "route_table" {
  source           = "../../modules/route_table"
  project_name     = var.project_name
  environment      = var.environment
  route_table_name = var.route_table_name
  location         = module.resource_group.location
  rg_name          = module.resource_group.rg_name
  tags             = var.tags

  # Pass list of objects directly from subnets module
  subnets = module.subnets.subnets
}

# Firewall Public IP
resource "azurerm_public_ip" "firewall" {
  name                = "rapidrore-uat-fw-pip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Firewall
module "firewall" {
  source             = "../../modules/firewall"
  firewall_name      = "rapidrore-uat-fw"
  location           = module.resource_group.location
  rg_name            = module.resource_group.rg_name
  sku_name           = "AZFW_VNet"
  sku_tier           = "Standard"
  threat_intel_mode  = "Alert"

  # Pick the firewall subnet ID from the list of objects
  firewall_subnet_id = one([for s in module.subnets.subnets : s.id if s.name == "AzureFirewallSubnet"])
  public_ip_id       = azurerm_public_ip.firewall.id

  network_rules      = var.network_rules
  application_rules  = var.application_rules
  tags               = var.tags
}