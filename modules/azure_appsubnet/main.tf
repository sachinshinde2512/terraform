
resource "azurerm_subnet" "azure_appsubnet" {
  name                 = "${var.name}-appsubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}