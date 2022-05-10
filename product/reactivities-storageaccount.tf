resource "azurerm_storage_account" "webapp_storageaccount" {
  name                = "hw${var.resourcecoprefix}webapp${var.environments[terraform.workspace]}"
  location            = azurerm_resource_group.hackerwaverg.location
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  account_kind             = "StorageV2"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
    error_404_document = "index.html"
  }
}