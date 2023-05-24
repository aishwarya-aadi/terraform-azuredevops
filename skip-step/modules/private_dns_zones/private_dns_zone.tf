resource "azurerm_private_dns_zone" "DnsZone" {
  for_each = var.DnsZone  
  name                = each.value["name"]
  resource_group_name = var.RgHubName
}
