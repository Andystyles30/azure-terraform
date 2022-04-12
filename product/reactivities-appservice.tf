# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service

resource "azurerm_app_service_plan" "reactivities_appservice" {
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
  app_service_plan_id = azurerm_app_service_plan.reactivities_appservice.id

  site_config {
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
      "hostingstart.html",
    ]
    scm_type = "VSTSRM"
    min_tls_version             = 1.2
    use_32_bit_worker_process   = true
    cors {
      support_credentials       = true
      allowed_origins           = []
    }
  }

  app_settings = {
    "TokenKey" = "_/)G=bblmNhLz2r:f5qxYT*cAFl{E?"
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_ENABLE_SYNC_UPDATE_SITE"]
    ]
  }
}