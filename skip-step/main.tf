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
  source = "./modules/vnet_subnet_hub"
  RgHubName = var.RgHubName #"rg-network-${var.Env}-${var.Location}"
  VnetHubName = var.VnetHubName
  Location            = var.Location
}
  
#module "private_dns_zones" {
#  source = "./modules/private_dns_zones"
#  RgHubName = var.RgHubName
#}

