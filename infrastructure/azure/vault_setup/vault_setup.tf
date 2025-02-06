data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "resource_group" {
  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = azurerm_resource_group.resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  enable_rbac_authorization   = true
}

# Generate a random password
resource "random_password" "linux_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

# Store the generated password in Key Vault
resource "azurerm_key_vault_secret" "linux_admin_password" {
  name         = "ansible-linux-admin-password"
  value        = random_password.linux_admin_password.result
  key_vault_id = azurerm_key_vault.key_vault.id
}
