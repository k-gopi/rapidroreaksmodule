resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  administrator_login          = var.admin_user
  administrator_login_password = var.admin_password
  version                      = "12.0"
  tags                         = var.tags
}

resource "azurerm_mssql_database" "this" {
  name      = var.database_name
  server_id = azurerm_mssql_server.this.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = "S0"
  tags      = var.tags
}