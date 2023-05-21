#terraform {
#  required_providers {
#    azurerm = {
#      source  = "hashicorp/azurerm"
#      version = "=3.9.0"
#    }
#  }
#}
#
## Configure the Microsoft Azure Provider
#provider "azurerm" {
#  features {}
#}
terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  version = ">=2.0"
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name #"terraform-rg"
  location = var.location #"eastus"
}
#resource "azurerm_log_analytics_workspace" "example" {
#  name                = "lgaishtestnew"
#  location            = var.location
#  resource_group_name = var.rg_name
#  sku                 = "PerGB2018"
#  retention_in_days   = 30
#}

#resource "azurerm_container_registry" "acr" {
#  name                = "acraishtestnew"
#  resource_group_name = var.rg_name
#  location            = var.location
#  sku                 = "Premium"
#  admin_enabled       = false
#  georeplications {
#    location                = "East US"
#    zone_redundancy_enabled = true
#    tags                    = {}
#  }
#  georeplications {
#    location                = "North Europe"
#    zone_redundancy_enabled = true
#    tags                    = {}
#  }
#}

