locals {
  common_tags = {
    environment = "production"
    project     = "webapp"
    managed_by  = "terraform"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-webapp-prod-aue"
  location = "Australia East"
  tags     = local.common_tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = "vnet-webapp-prod-aue"
  tags                = local.common_tags
}

module "storage" {
  source              = "../../modules/storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name_prefix         = "stwebappprd"
  tags                = local.common_tags
}


module "keyvault" {
  source              = "../../modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name_prefix         = "kvwebappprd"
  tags                = local.common_tags
  access_object_ids   = ["9733cd41-7337-4fdd-a442-c2a47c40cf7d", "b31d4bba-3d7a-4682-85fd-7e47312b2f39"]

}