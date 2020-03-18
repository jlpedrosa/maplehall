output "vpn_azure_endpoint_asn"{
    value=azurerm_virtual_network_gateway.vpn_gw.bgp_settings
}

output "vpn_azure_endpoint_bgp_peering_address"{
    value=azurerm_virtual_network_gateway.vpn_gw.bgp_settings
}


output "vpn_azure_endpoint_tunnel_public_ip_address_id"{
    value=azurerm_virtual_network_gateway.vpn_gw.ip_configuration
}
