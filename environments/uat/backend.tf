terraform {
  backend "azurerm" {
    resource_group_name  = "rapidrore-uat-tfstate-rg"   # correct RG
    storage_account_name = "rapidroreuattfstate"        # correct storage account
    container_name       = "tfstate"
    key                  = "rapidrore-uat.tfstate"
  }
}