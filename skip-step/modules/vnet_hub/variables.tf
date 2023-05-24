#variable "Env" {
#    type = string
#    
#}

variable "Location" {
    type = string
   
}


variable "VnetHubIp" {
  type = any
  default = []
}

variable "RgHubName" {
  type = any
  default = []
}


variable "VnetHubName" {
  type = any
  default = []
}
