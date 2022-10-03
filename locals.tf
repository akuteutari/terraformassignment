locals {
  storage_account_base_name = "TFAssignmentstorage"
  storage_account_count     = 1
  vnet_name                 = "TFAssignmentVNET"
  subnet_name               = "subnet1"
  nsg_name                  = "TFAssignmentNSG"
  address_prefix            = "10.1.0.0/16"
  address_space             = ["10.0.0.0/16"]
  location                  = "Sweden Central"
  resource_group_name       = "TFAssignmentRG"
  dns_servers               = ["10.0.0.4", "10.0.0.5"]
  WinVMprefix               = "WinVM"
}