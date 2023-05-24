resource "azurerm_virtual_network" "vnet" {
  name                = var.VnetHubName #"vnet-${var.Env}-${var.Location}"
  address_space       = var.VnetHubIp
  location            = var.Location
  resource_group_name = var.RgHubName#"rg-network-${var.Env}-${var.Location}"
 #  depends_on = [
 #   azurerm_resource_group.rg
 #]
}
