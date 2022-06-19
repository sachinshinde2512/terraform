output "azure_rg_output" {
    value = azurerm_resource_group.azure_rg.name
}

output "azure_location_output" {
    value = azurerm_resource_group.azure_rg.location
}