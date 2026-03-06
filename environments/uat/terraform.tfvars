project_name = "rapidrore"
environment  = "uat"
location     = "East US"
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