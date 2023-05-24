variable "RgHubName" {
  type = string
}

variable "DnsZone" {
    type = map(any)
    default = {
      DnsZone_1 = {
        name  = "mydomain1.com"
      }

      DnsZone_2 = {
        name = "mydomain2.com"
      } 

    }
}    
