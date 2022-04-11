# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service

resource "azurerm_app_service_plan" "reactivities_appserviceplace" {
  name                = "hw${var.resourcecoprefix}-reactivitiesapi-sp-${var.environments[terraform.workspace]}"
  location            = azurerm_resource_group.hackerwaverg.location
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  kind                = "windows" #linux
  reserved            = false #reserved

  sku {
    tier = "Free"
    size = "F1"
  }

	tags = {
      environment   = terraform.workspace
      build         = var.build
      system        = var.product_name
      reactivities  = "appservice"
  }
}

resource "azurerm_app_service" "reactivitiesapi_appservice" {
  name                = "hw${var.resourcecoprefix}-reactivitiesapi-as-${var.environments[terraform.workspace]}"
  location            = azurerm_resource_group.hackerwaverg.location
  resource_group_name = azurerm_resource_group.hackerwaverg.name
  app_service_plan_id = azurerm_app_service_plan.reactivities_appserviceplace.id

  # site_config {
  #   always_on                   = true
  #   min_tls_version             = 1.2
  #   cors {
  #     support_credentials       = true
  #     allowed_origins           = []
  #   }
  # }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_ENABLE_SYNC_UPDATE_SITE"]
    ]
  }
}