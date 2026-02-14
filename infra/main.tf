terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}


resource "azurerm_resource_group" "challenge-rg" {
  name     = "challenge-rg"
  location = "West Europe"
}

variable "dockerhub_username" {
    type: string
}

variable "dockerhub_token" {
    type: string
    sensitive: true
}

resource "azurerm_container_group" "challenge" {
  name                = "example-continst"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"
  
  image_registry_credential {
    server = "index.docker.io"
    username =  var.dockerhub_username
    password = var.dockerhub_token
  }


  container {
    name   = "challenge"
    image  = "flaviosgbr/fullstacklab:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}

output "conteiner_url" {
    value = "http://${{azurerm_container_group.app.ip_address}}"
}
