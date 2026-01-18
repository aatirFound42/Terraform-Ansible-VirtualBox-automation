# terraform/variables.tf


# virtualbox_vm.node[0]: Still creating... [03m10s elapsed]
# ╷
# │ Error: failed to unpack image https://app.vagrantup.com/ubuntu/boxes/jammy64/versions/20230616.0.0/providers/virtualbox.box: error unpacking gold image virtualbox.box: exit status 2
# │
# │   with virtualbox_vm.node[0],
# │   on main.tf line 3, in resource "virtualbox_vm" "node":
# │    3: resource "virtualbox_vm" "node" {
# │
# ╵

variable "vm_name" {
  description = "The hostname for the CI/CD node"
  type        = string
  default     = "python-cicd-node-1"
}

variable "cpus" {
  description = "Number of virtual CPUs"
  type        = number
  default     = 1
}

variable "memory" {
  description = "RAM allocation in MiB"
  type        = string
  default     = "2048 mib" # Scalable to 4096 mib for Selenium in Phase 3
}

variable "image_url" {
  description = "URL to the Vagrant box image"
  type        = string
  # Using Ubuntu 22.04 (Jammy) standard Vagrant box
  default     = "./ubuntu-jammy.box"
}

variable "host_network_interface" {
  description = "The name of the Host-Only network adapter on the Host machine"
  type        = string
  default     = "VirtualBox Host-Only Ethernet Adaptor" # User must verify this in VirtualBox settings
}