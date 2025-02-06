output "vm_id" {
  description = "ID of the created VM"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}

output "private_ip_address" {
  description = "Private IP address of the VM"
  value       = azurerm_network_interface.vm_nic.private_ip_address
} 
