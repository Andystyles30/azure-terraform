# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server

resource "azurerm_mysql_flexible_server" "reactivities_mysql" {
  name                   = "hw-reactivities-ms-dev"
  location            = azurerm_resource_group.hackerwaverg.location
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  administrator_login    = "asadmin"
  administrator_password = "m+6ZaN9.M']Vm&$R"
  backup_retention_days  = 7
  sku_name               = "B_Standard_B1ms"
}
 resource "azurerm_mysql_flexible_server_firewall_rule" "reactivities_mysql_firewall_rule" {
  name                = "officeVpn"
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  server_name         = azurerm_mysql_flexible_server.reactivities_mysql.name
  start_ip_address    = "52.151.65.254"
  end_ip_address      = "52.151.65.254"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "reactivities_mysql_firewall_rule_azure_services" {
  name                = "AzureServices"
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  server_name         = azurerm_mysql_flexible_server.reactivities_mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mysql_flexible_server_configuration" "reactivities_mysql_secure_transport" {
  name                = "require_secure_transport"
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  server_name         = azurerm_mysql_flexible_server.reactivities_mysql.name
  value               = "OFF"
}