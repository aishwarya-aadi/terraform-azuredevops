terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  version = ">=2.0"
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}

module "resource_group"{
  source = "./modules/resource_group_hub"
  RgHubName = var.RgHubName 
  Location = var.Location
}


module "vnet"{
  source = "./modules/vnet_hub"
  VnetHubName                = var.VnetHubName #"vnet-${var.Env}-${var.Location}"
  VnetHubIp       = var.VnetHubIp
  Location            = var.Location
  RgHubName = var.RgHubName
}


module "subnet" {
  for_each = var.subnets
  source = "./modules/vnet_subnet_hub"
  RgHubName = var.RgHubName #"rg-network-${var.Env}-${var.Location}"
  VnetHubName = var.VnetHubName
  Location            = var.Location
  each.value["name"] = each.value["name"]
  address_prefixes = each.value["address_prefixes"]
}


#resource "azurerm_resource_group" "rg" {
#  name     = "rg-network-${var.Env}-${var.Location}"
#  location = "${var.Location}"
#}

#resource "azurerm_virtual_network" "vnet" {
#  name                = "vnet-${var.Env}-${var.Location}"
#  address_space       = var.VnetHubIp
#  location            = var.Location
#  resource_group_name = "rg-network-${var.Env}-${var.Location}"
#}

#resource "azurerm_subnet" "subnet" {
#    for_each = var.subnets
#    resource_group_name = "rg-network-${var.Env}-${var.Location}"
#    virtual_network_name = azurerm_virtual_network.vnet.name
#    name = each.value["name"]
#    address_prefixes = each.value["address_prefixes"]
#  
#}
#
#
