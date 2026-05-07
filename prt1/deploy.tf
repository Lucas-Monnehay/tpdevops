terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

variable "network_host_if" {
  description = "Name of the host network card"
  type        = string
  # ON REMPLACE ICI 
  default     = "Realtek Gaming 2.5GbE Family Controller" 
}

resource "virtualbox_vm" "debian_node" {
  count     = 1
  name      = "vm_tp_final"
  image     = "https://vagrantcloud.com/generic/boxes/debian11/versions/4.3.12/providers/virtualbox.box"
  cpus      = 2
  memory    = "4.0 gib"

  network_adapter {
    type           = "bridged"
    host_interface = "Realtek Gaming 2.5GbE Family Controller"
  }
}

output "vm_ip" {
  value = virtualbox_vm.debian_node[0].network_adapter[0].ipv4_address
}