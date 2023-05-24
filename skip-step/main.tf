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
  name     = var.RgHubName
  location = var.Location
}


module "vnet"{
  source = "./modules/vnet_hub"
  name                = var.VnetHubName #"vnet-${var.Env}-${var.Location}"
  address_space       = var.VnetHubIp
  location            = var.Location
  resource_group_name = var.RgHubName
}


#module "subnet" {
#  for_each = var.subnets
#  source = "./modules/vnet_subnet_hub"
#  resource_group_name = var.RgHubName #"rg-network-${var.Env}-${var.Location}"
#  virtual_network_name = var.VnetHubName
#  name = each.value["name"]
#  address_prefixes = each.value["address_prefixes"]
#}


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
