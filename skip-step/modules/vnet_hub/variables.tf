variable "Env" {
    type = string
    
}

variable "Location" {
    type = string
   
}


variable "VnetHubIprange" {
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
