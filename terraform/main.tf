# terraform/main.tf

resource "virtualbox_vm" "node" {
  count     = 1
  name      = var.vm_name
  image     = "./template_vm.box"
  cpus      = var.cpus
  memory    = var.memory
  status    = "running"

  # Adapter 1: NAT for Internet (APT/PIP/DockerHub)
  network_adapter {
    type           = "nat"
    device         = "IntelPro1000MTDesktop"
  }

  # Adapter 2: Host-Only for Ansible & Observability
  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

# Output the IP address for verification
output "vm_ip_addr" {
  value = element(virtualbox_vm.node.*.network_adapter.1.ipv4_address, 0)
}

# Generate Ansible Inventory
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    # We grab the IP from the second adapter (index 1) which is Host-Only
    ip_addr = element(virtualbox_vm.node.*.network_adapter.1.ipv4_address, 0),
    ssh_key = "~/.vagrant.d/insecure_private_key" 
  })
  filename = "${path.module}/../ansible/inventory.ini"
}