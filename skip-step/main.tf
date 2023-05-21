terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  skip_provider_registration = "true"

  version = ">=3.9.0"
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name #"terraform-rg"
  location = var.location #"eastus"
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "acctest-01"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry1"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}

