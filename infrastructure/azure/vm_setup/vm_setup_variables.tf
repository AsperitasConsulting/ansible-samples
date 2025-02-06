variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault containing the SSH public key"
  type        = string
}

variable "key_vault_resource_group" {
  description = "Resource group name containing the Azure Key Vault"
  type        = string
}

variable "ssh_public_key_secret_name" {
  description = "Name of the secret in Key Vault containing the SSH public key"
  type        = string
}


