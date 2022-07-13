//provider "azurerm" {
// features {}
//}

resource "azurerm_resource_group" "azure_rg" {
  name     = "${var.name}-rg"
  location = var.location
}
