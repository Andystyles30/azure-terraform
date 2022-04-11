provider "azurerm" {
  version = "~> 2.20.0"
  features {}
}

// https://www.terraform.io/docs/providers/azurerm/r/resource_group.html
resource "azurerm_resource_group" "hackerwaverg" {
  lifecycle {
    prevent_destroy = false
  }
  name     = "hw${var.resourcecoprefix}-${var.environments[terraform.workspace]}"
  location = var.selected_region

  tags = {
      environment = terraform.workspace
      build       = var.build
      product      = var.product_name
      unmanaged   = "true"
  }
}