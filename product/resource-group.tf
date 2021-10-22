provider "azurerm" {
  version = "~> 2.20.0"
  features {}
}

// https://www.terraform.io/docs/providers/azurerm/r/resource_group.html
resource "azurerm_resource_group" "hackerwavearg" {
  lifecycle {
    prevent_destroy = false
  }
  name     = "rxt${var.resourcecoprefix}-${var.environments[terraform.workspace]}"
  location = var.selected_region

  tags = {
      environment = terraform.workspace
      build       = var.build
      product      = var.product_name
      unmanaged   = "true"
  }
}