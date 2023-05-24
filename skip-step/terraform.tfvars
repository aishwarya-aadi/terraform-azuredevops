#Env = "Dev"
#Location = "westeurope"
RgHubName = "rg-network-poc-westeurope"
#Env = "POC"
Location = "westeurope"
VnetHubName = "vnet-poc-westeurope"
VnetHubIp = ["10.0.0.0/16"]
subnets = {
  
      subnet_1 = {
        name = "SubnetErGateway"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet_2 = {
        name = "SubnetFirewall"
        address_prefixes =["10.0.0.0/24"]
      } 

      subnet_3 = {
        name = "SubnetDnsPrInbound"
        address_prefixes =["10.0.2.0/24"]        
      }

      subnet_4 = {
        name = "SubnetDnsPrOutbound"
        address_prefixes =["10.0.3.0/24"]        
      }
      subnet_5 = {
        name = "SubnetPrivateLink"
        address_prefixes =["10.0.4.0/24"]        
      }
    } 
variable "DnsZone" {
    type = map(any)
    default = {
      DnsZone_1 = {
        name  = "mydomain1.com"
      }

      DnsZone_2 = {
        name = "mydomain1.com"
      } 

    }
}
