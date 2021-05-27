# https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_account.html

resource "azurerm_cosmosdb_account" "db" {
  name                = "andy-orderstore-cs"
  location            = azurerm_resource_group.andys-new-resource-group.location
  resource_group_name = azurerm_resource_group.andys-new-resource-group.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true
  enable_free_tier = false

  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    prefix            = "andy-cosmosdbgeo"
    location          = azurerm_resource_group.andys-new-resource-group.location
    failover_priority = 0
  }

	tags = {
      environment = terraform.workspace
      build       = var.build
      system      = var.product_name
  }
}