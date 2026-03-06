project_name = "rapidrore"
environment  = "uat"
location     = "East US"
rg_name      = "rapidrore-uat-rg"

tags = {
  Owner       = "DevOps-Team"
  CostCenter  = "IT"
  Application = "AKS"
}

vnet_name     = "rapidrore-uat-vnet"
address_space = ["10.0.0.0/16"]
dns_servers   = []