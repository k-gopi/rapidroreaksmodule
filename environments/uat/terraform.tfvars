project_name = "rapidrore"
environment  = "uat"
location     = "centralindia"
rg_name      = "rapidrore-uat-rg"

tags = {
  Owner       = "DevOps-Team"
  CostCenter  = "IT"
  Application = "AKS"
}

# VNet
vnet_name     = "rapidrore-uat-vnet"
address_space = ["10.0.0.0/16"]
dns_servers   = []

# Subnets
subnets = [
  { name = "aks-subnet",       address_prefix = "10.0.0.0/24" },
  { name = "app-subnet",       address_prefix = "10.0.1.0/24" },
  { name = "db-subnet",        address_prefix = "10.0.2.0/24" },
  { name = "bastion-subnet",   address_prefix = "10.0.3.0/27" },
  { name = "firewall-subnet",  address_prefix = "10.0.4.0/26" }
]
# NSG module variables
nsg_name = "rapidrore-uat-nsg"
nsg_rules = [
  {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Allow-HTTPS"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Allow-HTTP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]
# -----------------------------
# Route Table
# -----------------------------
route_table_name = "rapidrore-uat-rt"

# Private DNS module variables

private_dns_zone_name   = "rapidrore-uat.private"

# loganalytics module variable

workspace_name = "rapidrore-uat-law"

# storage account module variable

storage_account_name = "rapidroreuatstorage"

# managed identity module variable

identity_name = "rapidrore-uat-identity"

# acr module variable

acr_name = "rapidroreuatacr"

# keyvault module variable
kv_name = "rapidrore-uat-kv1234"

# sql module variable
sql_server_name = "rapidrore-uat-sql"
database_name   = "rapidrore-uat-db"
admin_user      = "sqladmin"
# application_insights module variable
app_insights_name             = "rapidrore-uat-ai"

# firewall module variable
# Firewall rules
# Firewall
# -----------------------------
# Firewall
# -----------------------------
# Firewall rules
network_rules = [
  {
    name                  = "Allow-DNS"
    priority              = 100
    action                = "Allow"
    rule_name             = "dns-rule"
    protocols             = ["TCP","UDP"]
    source_addresses      = ["10.0.0.0/16"]
    destination_addresses = ["8.8.8.8","8.8.4.4"]
    destination_ports     = ["53"]
  }
]

application_rules = [
  {
    name             = "Allow-HTTP-HTTPS"
    priority         = 200
    action           = "Allow"
    rule_name        = "http-https-rule"
    protocol         = "Https"
    protocol_port    = 443
    source_addresses = ["10.0.0.0/16"]
    target_fqdns     = ["*.google.com","*.microsoft.com"]
  }
]