
resource "azurerm_subnet" "azure_websubnet" {
  name                 = "${var.name}-websubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.3.0/24"]
}