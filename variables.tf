variable "subscription_id" {
  default = "19ea74f3-cc3e-44df-a118-797920825fd2"
}
variable "tenant_id" {
  default = "46b20978-2a1c-40a5-838f-5c9a7d34af78"
}
variable "cosmos_db_account_name" {
  default = "velidacosmosterraform"
}
variable "selected_region" {
  default     = "uksouth"
  description = "Select region for deployment"
}
variable "build" {
  default = "1.0"
}
variable "product_name" {
  default     = "styles"
  description = "Used for the product tag"
}
