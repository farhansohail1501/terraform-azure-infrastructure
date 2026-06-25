output "key_vault_name" {
  value = azurerm_key_vault.this.name
}

output "key_vault_id" {
  value = azurerm_key_vault.this.id
}

output "app_password" {
  value     = random_password.app.result
  sensitive = true
}