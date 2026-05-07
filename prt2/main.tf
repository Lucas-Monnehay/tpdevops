terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "monitoring_node" {
  name   = "vm_monitoring"
  image  = "https://vagrantcloud.com/generic/boxes/debian11/versions/4.3.12/providers/virtualbox.box"
  cpus   = 2
  memory = "2.0 gib"

  network_adapter {
    type           = "bridged"
    host_interface = "Realtek Gaming 2.5GbE Family Controller"
  }
}

output "monitoring_ip" {
  value = virtualbox_vm.monitoring_node.network_adapter[0].ipv4_address
}