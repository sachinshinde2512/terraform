terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesah2ir7"
    container_name       = "tfstate"
    key                  = "infra.tfstate"
  }

}

provider "azurerm" {
  features {}
}

module "azure_rg" {
    source = ".//modules/azure_rg"
    name = var.name
    location = var.location
}

module "azure_vnet" {
    source = ".//modules/azure_vnet"
    name = "${var.name}"
    location = module.azure_rg.azure_location_output
    resource_group_name = module.azure_rg.azure_rg_output
    address_space = var.address_space
}
