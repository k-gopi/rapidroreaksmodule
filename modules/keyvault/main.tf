resource "azurerm_key_vault" "this" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete",
      "Backup", "Restore", "Encrypt", "Decrypt", "Sign", "Verify",
      "WrapKey", "UnwrapKey", "Release", "Rotate"
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Backup", "Restore", "Purge"
    ]

    # Uncomment if you need certificate permissions
    # certificate_permissions = [
    #   "Get", "List", "Update", "Create", "Import", "Delete",
    #   "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers",
    #   "DeleteIssuers", "Purge"
    # ]
  }

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  tags = var.tags
}