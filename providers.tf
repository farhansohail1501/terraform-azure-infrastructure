terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-aue"
    storage_account_name = "sttfstate2063"
    container_name       = "tfstate"
    key                  = "infrastructure.tfstate"
  }
}
#
provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}