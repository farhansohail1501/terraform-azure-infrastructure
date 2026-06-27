#
locals {
  common_tags = {
    environment = "production"
    project     = "webapp"
    managed_by  = "terraform"
  }
}

# A resource group = a labeled box that holds our future resources
resource "azurerm_resource_group" "main" {
  name     = "rg-webapp-prod-aue"
  location = "Australia East"
  tags     = local.common_tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = "vnet-webapp-prod-aue"
  tags                = local.common_tags

}