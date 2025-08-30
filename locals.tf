// local variables to hold nic ids and vm ids

locals {
    nics = {
       vm1 = {
            nic_id = azurerm_network_interface.vm-nic.id
            ip_configuration_name = "vm-nic-ip-configuration"
        }
         
        vm2 = {
            nic_id = azurerm_network_interface.linux-vm-nic.id
            ip_configuration_name = "linux-vm-nic-ip-configuration"
        }   
    }

    vm_ids = {
        vm1 = azurerm_virtual_machine.windows-vm.id
        vm2 = azurerm_linux_virtual_machine.linux-vm.id
    }
}