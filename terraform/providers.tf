# terraform/providers.tf

terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
    # local = {
    #   source  = "hashicorp/local"
    #   version = "2.4.0"
    # }
  }
}

provider "virtualbox" {
  delay      = 60  # Seconds to wait for the VM to boot before attempting connection
  mintimeout = 5
}