module "rgs" {
  source = "../../moduel/resource_group"
  rgs    = var.rgs

}
module "moduel_vnet" {
  depends_on = [module.rgs]
  source     = "../../moduel/virtual_network"
  vnets      = var.vnets

}
module "moduel_subnet" {
  depends_on = [module.moduel_vnet]
  source     = "../../moduel/subnet"
  subnets    = var.subnets


}

module "moduel_pub_ip" {
  depends_on = [module.rgs]
  source     = "../../moduel/pub_ip"
  pub_ip     = var.pub_ip
}
module "module_vm" {
  depends_on = [module.moduel_pub_ip, module.moduel_vnet, module.moduel_subnet]
  source     = "../../moduel/virtual_machine"
  pub_ip     = var.pub_ip
  vms        = var.vms

}