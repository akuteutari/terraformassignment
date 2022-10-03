#Outputs
output "vNetLocationProvisioned" {
  value = module.VirtualNetwork.vnet_location_out
}

output "vNetNameCreated" {
  value = module.VirtualNetwork.vnet_name_out
}

output "VnetAddressSpaceProvisioned" {
  value = module.VirtualNetwork.vnet_address_space_out
}

output "VnetDnsServersProvisioned" {
  value = module.VirtualNetwork.vnet_dns_servers_out
}