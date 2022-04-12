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

