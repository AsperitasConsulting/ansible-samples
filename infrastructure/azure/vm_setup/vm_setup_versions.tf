terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = "~>3.0"
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}