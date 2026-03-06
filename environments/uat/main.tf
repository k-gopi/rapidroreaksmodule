module "resource_group" {
  source       = "../../modules/resource_group"
  rg_name      = var.rg_name
  location     = var.location
  project_name = var.project_name
  environment  = var.environment
  tags         = var.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  tags                = var.tags
}
module "subnets" {
  source              = "../../modules/subnets"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
  vnet_name           = module.vnet.vnet_name
  subnets             = var.subnets
  tags                = var.tags
}
# -----------------------------
# Network Security Group
# -----------------------------
module "nsg" {
  source       = "../../modules/nsg"
  project_name = var.project_name        # add this
  environment  = var.environment         # add this
  nsg_name     = var.nsg_name
  nsg_rules    = var.nsg_rules
  location     = var.location
  rg_name      = module.resource_group.rg_name
  tags         = var.tags
}