variable "environments" {
  type = map
  default = {
    "dev"     = "dev"
  }
}

variable "cosmos_db_account_name" {
  default = "velidacosmosterraform"
}
variable "selected_region" {
  default     = "uksouth"
  # default     = "southcentralus"
  description = "Select region for deployment"
}
variable "build" {
  default = "1.0"
}
variable "product_name" {
  default     = "hackerwave"
  description = "Used for the product tag"
}

# Injected variables
variable "resourcecoprefix" {}
variable "tenant_id" {}