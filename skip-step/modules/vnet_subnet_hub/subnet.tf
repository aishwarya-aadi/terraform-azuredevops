resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  resource_group_name = var.RgHubName #"rg-network-${var.Env}-${var.Location}"
  virtual_network_name = var.VnetHubName
  name = each.value["name"]
  address_prefixes = each.value["address_prefixes"]
  #depends_on = [
  #  azurerm_resource_group.rg , azurerm_virtual_network.vnet
 #]    
}
