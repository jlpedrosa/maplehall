resource "azurerm_resource_group" "remote_home_rg" {
  name     = "${var.prefix}-remote-rg"
  location = var.location
}

resource "azurerm_virtual_network" "remote_home_vnet" {
  name                = "${var.prefix}-home-remote-vnet"
  location            = azurerm_resource_group.remote_home_rg.location
  resource_group_name = azurerm_resource_group.remote_home_rg.name
  address_space       = ["10.${var.subnet_part}.0.0/16"]
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.remote_home_rg.name
  virtual_network_name = azurerm_virtual_network.remote_home_vnet.name
  address_prefix       = "10.${var.subnet_part}.1.0/24"
}

resource "azurerm_public_ip" "vpn_pub_ip" {
  name                = "vpn_pub_ip"
  location            = azurerm_resource_group.remote_home_rg.location
  resource_group_name = azurerm_resource_group.remote_home_rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "vpn_gw" {
  name                = "vpn_network_gateeway"
  location            = azurerm_resource_group.remote_home_rg.location
  resource_group_name = azurerm_resource_group.remote_home_rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"
  sku      = "Basic"

  active_active = false
  enable_bgp    = false

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn_pub_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

resource "azurerm_local_network_gateway" "home" {
  name                = "home_gw"
  location            = azurerm_resource_group.remote_home_rg.location
  resource_group_name = azurerm_resource_group.remote_home_rg.name
  gateway_address     = var.home_up_ip
  address_space       = [var.home_subnet]
}


resource "azurerm_virtual_network_gateway_connection" "home_site" {
  name                = "home_site"
  location            = azurerm_resource_group.remote_home_rg.location
  resource_group_name = azurerm_resource_group.remote_home_rg.name

  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.home.id

  type       = "IPsec"
  shared_key = var.vpn_psk
  enable_bgp = false
}
