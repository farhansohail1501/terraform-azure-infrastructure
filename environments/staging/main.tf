locals {
  common_tags = {
    environment = "staging"
    project     = "webapp"
    managed_by  = "terraform"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-webapp-staging-aue"
  location = "Australia East"
  tags     = local.common_tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = "vnet-webapp-staging-aue"
  tags                = local.common_tags
}

module "storage" {
  source              = "../../modules/storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name_prefix         = "stwebappstg"
  tags                = local.common_tags
}

module "keyvault" {
  source              = "../../modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name_prefix         = "kvwebappstg"
  tags                = local.common_tags
}

module "compute" {
  source              = "../../modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.network.subnet_id
  vm_name             = "vm-webapp-stg"
  admin_password      = module.keyvault.app_password
  tags                = local.common_tags
}