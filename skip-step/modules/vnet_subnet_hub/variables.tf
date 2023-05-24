variable "Location" {
    type = string
   
}


variable "VnetHubIp" {
  type = any
  default = []
}

variable "subnets" {
    type = map(any)
    default = {
    } 
}

variable "VnetHubName" {
  type = any
  default = []
}

variable "RgHubName" {
  type = any
  default = []
}
