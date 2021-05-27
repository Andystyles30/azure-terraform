provider "azurerm" {
  version = "~> 2.20.0"
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant_id}"
  features {}
}

// https://www.terraform.io/docs/providers/azurerm/r/resource_group.html
resource "azurerm_resource_group" "andys-new-resource-group" {
  lifecycle {
    prevent_destroy = false
  }
  name     = "andys-new-resourse-group"
  location = var.selected_region

  tags = {
      environment = terraform.workspace
      build       = var.build
      product      = var.product_name
      unmanaged   = "true"
  }
}