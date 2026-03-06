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

# -----------------------------
# Route Table
# -----------------------------
module "route_table" {
  source           = "../../modules/route_table"
  project_name     = var.project_name
  environment      = var.environment
  route_table_name = var.route_table_name
  location         = var.location
  rg_name          = module.resource_group.rg_name
  tags             = var.tags
  subnets          = [for s in module.subnets.subnets : { id = s.id, name = s.name }]
}

module "private_dns" {
  source                = "../../modules/private_dns"
  project_name          = var.project_name
  environment           = var.environment
  rg_name               = module.resource_group.rg_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_ids   = [module.vnet.vnet_id]
  tags                  = var.tags
}

module "log_analytics" {
  source         = "../../modules/log_analytics"

  project_name   = var.project_name
  environment    = var.environment
  workspace_name = var.workspace_name

  location       = var.location
  rg_name        = module.resource_group.rg_name

  tags           = var.tags
}

module "storage_account" {
  source = "../../modules/storage_account"

  project_name         = var.project_name
  environment          = var.environment
  storage_account_name = var.storage_account_name

  location = var.location
  rg_name  = module.resource_group.rg_name

  tags = var.tags
}

module "managed_identity" {

  source = "../../modules/managed_identity"

  project_name  = var.project_name
  environment   = var.environment
  identity_name = var.identity_name

  location = var.location
  rg_name  = module.resource_group.rg_name

  tags = var.tags
}

module "acr" {

  source = "../../modules/acr"

  project_name = var.project_name
  environment  = var.environment

  acr_name = var.acr_name

  location = var.location
  rg_name  = module.resource_group.rg_name

  identity_principal_id = module.managed_identity.identity_principal_id

  tags = var.tags
}

module "keyvault" {
  source   = "../../modules/keyvault"

  kv_name   = var.kv_name          # from terraform.tfvars
  rg_name   = var.rg_name
  location  = var.location
  tenant_id = var.tenant_id        # from environment variable TF_VAR_tenant_id
  object_id = var.object_id        # from environment variable TF_VAR_object_id
  tags      = var.tags
}