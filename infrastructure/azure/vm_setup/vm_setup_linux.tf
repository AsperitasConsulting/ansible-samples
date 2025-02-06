module "linux_vm" {
  source = "./modules/linux_vm"

  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  vm_name             = "linux-vm"
  subnet_id           = azurerm_subnet.subnet.id
  ssh_public_key      = data.azurerm_key_vault_secret.ssh_public_key.value

  tags = {
    operating_system = "linux"
  }
}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = var.ssh_public_key_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}
