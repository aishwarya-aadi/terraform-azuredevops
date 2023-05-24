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
  name     = "rg-network-${var.Env}-${var.Location}"
  location = "${var.Location}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.Env}-${var.Location}"
  address_space       = var.VnetHubIp
  location            = var.Location
  resource_group_name = "rg-network-${var.Env}-${var.Location}"
}
#
#resource "azurerm_subnet" "subnet" {
#    for_each = var.subnets
#    resource_group_name = "rg-network-${var.Env}-${var.Location}"
#    virtual_network_name = azurerm_virtual_network.vnet.name
#    name = each.value["name"]
#    address_prefixes = each.value["address_prefixes"]
#  
#}


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

#resource "azurerm_kubernetes_cluster" "example" {
#  name                = "example-aks1"
#  location            = azurerm_resource_group.example.location
#  resource_group_name = azurerm_resource_group.example.name
#  dns_prefix          = "exampleaks1"
#
#  default_node_pool {
#    name       = "default"
#    node_count = 1
#    vm_size    = "Standard_D2_v2"
#  }
#
#  identity {
#    type = "SystemAssigned"
#  }
#
#  tags = {
#    Environment = "Production"
#  }
#}
#
#output "client_certificate" {
#  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
#  sensitive = true
#}
#
#output "kube_config" {
#  value = azurerm_kubernetes_cluster.example.kube_config_raw
#
#  sensitive = true
#}

#resource "azurerm_key_vault" "example" {
#  name                        = "examplekeyvault"
#  location                    = azurerm_resource_group.example.location
#  resource_group_name         = azurerm_resource_group.example.name
#  enabled_for_disk_encryption = true
#  tenant_id                   = data.azurerm_client_config.current.tenant_id
#  soft_delete_retention_days  = 7
#  purge_protection_enabled    = false
#
#  sku_name = "standard"
#
#  access_policy {
#    tenant_id = data.azurerm_client_config.current.tenant_id
#    object_id = data.azurerm_client_config.current.object_id
#
#    key_permissions = [
#      "Get",
#    ]
#
#    secret_permissions = [
#      "Get",
#    ]
#
#    storage_permissions = [
#      "Get",
#    ]
#  }
#}
#resource "azurerm_virtual_network" "example" {
#  name                = "example-vnet"
#  address_space       = ["10.0.0.0/16"]
#  location            = azurerm_resource_group.example.location
#  resource_group_name = azurerm_resource_group.example.name
#}
#
#resource "azurerm_subnet" "example" {
#  name                 = "example-subnet"
#  resource_group_name  = azurerm_resource_group.example.name
#  virtual_network_name = azurerm_virtual_network.example.name
#  address_prefixes     = ["10.0.1.0/24"]
#
#  delegation {
#    name = "delegation"
#
#    service_delegation {
#      name    = "Microsoft.ContainerInstance/containerGroups"
#      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#    }
#  }
#}
