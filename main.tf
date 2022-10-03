terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.88.1"
    }
  }
}

provider "azurerm" {
  features {

  }
}

module "ResourceGroup" {
  source    = "./ResourceGroup"
  base_name = local.resource_group_name
  location  = local.location

}

module "VirtualNetwork" {
  source              = "./Network"
  resource_group_name = local.resource_group_name
  vnet_name           = local.vnet_name
  address_prefix      = local.address_prefix
  location            = local.location
  nsg_name            = local.nsg_name
  dns_servers         = local.dns_servers
  subnet_name         = local.subnet_name
  address_space       = local.address_space
  depends_on = [
    module.ResourceGroup
  ]
}

module "StorageAccount" {
  source              = "./StorageAccount"
  storage_acc_count   = local.storage_account_count
  base_name           = local.storage_account_base_name
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    module.VirtualNetwork
  ]
}

module "WindowsVirtualMachine" {
  source              = "./WindowsVirtualMachine"
  prefix              = local.WinVMprefix
  subnet_id           = module.VirtualNetwork.subnet_id
  resource_group_name = local.resource_group_name
  location            = local.location

}

module "LinuxVirtualMachine" {
  source              = "./LinuxVirtualMachine"
  base_name           = "LinuxVM"
  resource_group_name = local.resource_group_name
  location            = local.location
  computer_name       = "TFAssignmentVM"
  admin_password      = "TestPW4321"
  admin_username      = "azureadmin"
  subnet_id           = module.VirtualNetwork.subnet_id
}
