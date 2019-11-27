terraform {
  backend "azurerm" {
    storage_account_name  = "${var.storage_account_name}"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
	version = "=1.30.1"
}
module "nginx" {
  source = "./modules/nginx"
  resource_group = azurerm_resource_group.default
}

resource "azurerm_resource_group" "default" {
  name     = "${terraform.workspace}"
  location = "uksouth"
}

resource "azurerm_virtual_network" "default" {
  name                = "${terraform.workspace}-network"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.location
  resource_group_name = azurerm_resource_group.name
}
