# "Who am I right now?" — grabs your tenant & user ID from Azure
data "azurerm_client_config" "current" {}

# Vault names must be globally unique too
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

# The vault (the safe itself)
resource "azurerm_key_vault" "this" {
  name                = "${var.name_prefix}${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  tags                = var.tags

  # Who can open the safe, and what they can do
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
  }
}

# Generate a strong random password
resource "random_password" "app" {
  length  = 20
  special = true
}

# Put that password INTO the vault as a secret
resource "azurerm_key_vault_secret" "app_password" {
  name         = "app-admin-password"
  value        = random_password.app.result
  key_vault_id = azurerm_key_vault.this.id
}