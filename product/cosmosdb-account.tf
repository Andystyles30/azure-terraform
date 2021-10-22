# https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_account.html

resource "azurerm_cosmosdb_account" "db" {
  name            = "rxt${var.resourcecoprefix}-orderstore-cs-${var.environments[terraform.workspace]}"
  location            = azurerm_resource_group.hackerwavearg.location
  resource_group_name = azurerm_resource_group.hackerwavearg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true
  enable_free_tier = true

  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    prefix            = "rxt${var.resourcecoprefix}-cosmosdbgeo-${var.environments[terraform.workspace]}"
    location          = azurerm_resource_group.hackerwavearg.location
    failover_priority = 0
  }

	tags = {
      environment = terraform.workspace
      build       = var.build
      system      = var.product_name
  }
}