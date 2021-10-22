# https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_sql_database.html
resource "azurerm_cosmosdb_sql_database" "order_tracking_db" {
  name                = "OrderTrackingDb"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  //throughput          = 400
}

# https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_sql_container.html
resource "azurerm_cosmosdb_sql_container" "items" {
  name                = "Items"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.order_tracking_db.name
  partition_key_path  = "/_partitionKey"
  //throughput          = 400

  unique_key {
    paths = ["/key"]
  }
}