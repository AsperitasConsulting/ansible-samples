module "linux_vm" {
  source = "./modules/linux_vm"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = "linux-vm"
  subnet_id           = azurerm_subnet.subnet.id
  ssh_public_key      = file("~/.ssh/id_rsa.pub")

  tags = {
    environment = "dev"
  }
}
