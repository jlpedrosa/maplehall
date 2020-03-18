variable "location" {
  type        = string
  description = "The azure region where the resources will be created"
}

variable "prefix" {
  type        = string
  description = "The naming prefix for the resources"
}

variable "subnet_part" {
  type        = string
  description = "The second digit of the private range of subnet addreses for home"
}

variable "home_subnet" {
  type        = string
  description = "The cdir range for home setup"
}

variable "vpn_psk" {
  type        = string
  description = "The preshared key for the vpn"
}

variable "home_up_ip" {
  type        = string
  description = "The public ip of the home router"
}