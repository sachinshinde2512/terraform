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
  source   = ".//modules/azure_rg"
  name     = var.name
  location = var.location
}

module "azure_vnet" {
  source              = ".//modules/azure_vnet"
  name                = var.name
  location            = var.location
  resource_group_name = module.azure_rg.azure_rg_output
  address_space       = var.address_space
}

module "azure_lbsubnet" {
  source               = ".//modules/azure_lbsubnet"
  name                 = var.name
  resource_group_name  = module.azure_rg.azure_rg_output
  virtual_network_name = module.azure_vnet.azure_vnetname_output
  address_prefixes     = var.address_prefixes
}

module "azure_websubnet" {
  source               = ".//modules/azure_websubnet"
  name                 = var.name
  resource_group_name  = module.azure_rg.azure_rg_output
  virtual_network_name = module.azure_vnet.azure_vnetname_output
  address_prefixes     = var.address_prefixes
}

module "azure_appsubnet" {
  source               = ".//modules/azure_appsubnet"
  name                 = var.name
  resource_group_name  = module.azure_rg.azure_rg_output
  virtual_network_name = module.azure_vnet.azure_vnetname_output
  address_prefixes     = var.address_prefixes
}

module "azure_vm" {
  source              = ".//modules/azure_vm"
  name                = var.name
  location            = var.location
  resource_group_name = module.azure_rg.azure_rg_output
  subnet_id           = module.azure_appsubnet.azure_appsubnetid_output
  address_prefixes    = var.address_prefixes
  virtual_network_name= module.azure_vnet.azure_vnetname_output
}