output "azure_vnetid_output" {
    value = azurerm_virtual_network.azure_vnet.id
}

output "azure_vnetname_output" {
    value = azurerm_virtual_network.azure_vnet.name
}

output "azure_nsgid_output" {
    value = azurerm_network_security_group.azure_nsg.id
}

output "azure_nsgname_output" {
    value = azurerm_network_security_group.azure_nsg.name
}
