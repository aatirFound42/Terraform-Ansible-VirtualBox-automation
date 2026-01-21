# terraform/variables.tf

variable "vm_count" {
  description = "Number of VM nodes to create"
  type        = number
  default     = 1
}

variable "vm_name" {
  description = "The hostname for the CI/CD node"
  type        = string
  default     = "node"
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
  # Using custom made image
  default     = "./guestNodeTemplate.box"
}

variable "host_network_interface" {
  description = "The name of the Host-Only network adapter on the Host machine"
  type        = string
  default     = "VirtualBox Host-Only Ethernet Adapter"
   # User must verify this in VirtualBox settings
}
