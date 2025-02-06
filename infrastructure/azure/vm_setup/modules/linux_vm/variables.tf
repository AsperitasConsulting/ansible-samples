variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region location"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the VM should be placed"
}

variable "vm_size" {
  type        = string
  description = "Size of the VM"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "adminuser"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for VM access"
}

variable "storage_account_type" {
  type        = string
  description = "Storage account type for OS disk"
  default     = "Standard_LRS"
}

variable "image_publisher" {
  type        = string
  description = "Publisher of the VM image"
  default     = "Canonical"
}

variable "image_offer" {
  type        = string
  description = "Offer of the VM image"
  default     = "UbuntuServer"
}

variable "image_sku" {
  type        = string
  description = "SKU of the VM image"
  default     = "18.04-LTS"
}

variable "image_version" {
  type        = string
  description = "Version of the VM image"
  default     = "latest"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the VM"
  default     = {}
} 
