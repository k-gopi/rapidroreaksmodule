output "subnets" {
  value = [
    { name = "aks-subnet", id = azurerm_subnet.aks.id },
    { name = "app-subnet", id = azurerm_subnet.app.id },
    { name = "db-subnet", id = azurerm_subnet.db.id },
    { name = "bastion-subnet", id = azurerm_subnet.bastion.id },
    { name = "AzureFirewallSubnet", id = azurerm_subnet.firewall.id }
  ]
}