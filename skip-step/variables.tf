variable "Env" {
    type = string
    #default = "POC"
}

variable "Location" {
    type = string
   # default = "westeurope"
}

#variable "RgHubName" {
#    type = string
#}
#
#variable "VnetHubName" {
#  type = string
#
#}
#
variable "VnetHubIp" {
  type = any
  default = ["10.0.0.0/16"]
}

variable "subnets" {
    type = map(any)
    default = {
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
        address_prefixes =["10.0.1.0/26"]        
      }

      subnet_4 = {
        name = "SubnetDnsPrOutbound"
        address_prefixes =["10.0.1.0/27"]        
      }
      subnet_5 = {
        name = "SubnetPrivateLink"
        address_prefixes =["10.0.1.0/28"]        
      }
    } 
}

