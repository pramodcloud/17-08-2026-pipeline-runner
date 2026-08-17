data "azurerm_subnet" "datablock" {
  for_each = var.vms

  name                 = each.value.subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public" {
  for_each = var.pub_ip

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}