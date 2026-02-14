terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "challenge-rg"
  location = "West Europe"
}

variable "dockerhub_username" {
    type = string
}

variable "dockerhub_token" {
    type = string
    sensitive = true
}

resource "azurerm_container_group" "app" {
  name                = "challenge-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
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
exposed_port {
      port = 80
      protocol = "TCP"
  }
}
