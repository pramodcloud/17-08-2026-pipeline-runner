rgs = {


  rg1 = {
    name     = "prod"
    location = "austriaeast"


  }
}

vnets = {

  vnet1 = {

    name                = "prod-vnet1"
    location            = "austriaeast"
    resource_group_name = "prod"
    address_space       = ["10.0.0.0/16"]

  }


}

subnets = {

  sub1 = {

    name                 = "prod-sub"
    resource_group_name  = "prod"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "prod-vnet1"

  }
  sub2 = {

    name                 = "backend-sub"
    resource_group_name  = "prod"
    address_prefixes     = ["10.0.2.0/24"]
    virtual_network_name = "prod-vnet1"

  }
  
}

pub_ip = {
  pub_ip1 = {
    name                = "public_ip1"
    resource_group_name = "prod"
    location            = "austriaeast"
    allocation_method   = "Static"
  }

  pub_ip2 = {
    name                = "public_ip2"
    resource_group_name = "prod"
    location            = "austriaeast"
    allocation_method   = "Static"
  }
}

vms = {
  vm1 = {
    name                = "nic1"
    location            = "austriaeast"
    resource_group_name = "prod"

    name_config                   = "nic_config"
    private_ip_address_allocation = "Dynamic"

    virtual_machine_name            = "prod-vm"
    size                            = "Standard_B2as_v2"
    admin_username                  = "adminuser"
    admin_password                  = "admin@1234"
    disable_password_authentication = false

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    # data_subne_block
    subnet          = "prod-sub"
    virtual_network_name = "prod-vnet1"


    # data_public_block
    # pub_name = "public_ip"
    public_ip_key = "pub_ip1"
  }
  vm2={
    name                = "nic2"
    location            = "austriaeast"
    resource_group_name = "prod"

    name_config                   = "nic_config1"
    private_ip_address_allocation = "Dynamic"

    virtual_machine_name            = "prod-vm1"
    size                            = "Standard_B2as_v2"
    admin_username                  = "adminuser"
    admin_password                  = "admin@1234"
    disable_password_authentication = false

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    # data_subne_block
    subnet          = "backend-sub"
    virtual_network_name = "prod-vnet1"


    # data_public_block
    # pub_name = "public_ip"
    public_ip_key = "pub_ip2"
  }
}
