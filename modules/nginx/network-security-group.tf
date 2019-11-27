resource "azurerm_network_security_group" "front" {
    name                = "${terraform.workspace}-front-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
resource "azurerm_network_security_group" "back" {
    name                = "${terraform.workspace}-back-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH1"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.1.0/24"
        destination_address_prefix = "*"
    }
   security_rule {
        name                       = "SSH2"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.3.0/24"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH3"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.4.0/24"
        destination_address_prefix = "*"
    }


}
resource "azurerm_network_security_group" "data" {
    name                = "${terraform.workspace}-data-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH1"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.2.0/24"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH2"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.3.0/24"
        destination_address_prefix = "*"
    }

} 
resource "azurerm_network_security_group" "manage" {
    name                = "${terraform.workspace}-manage-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH1"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "HTTP"
        priority                   = 1004
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}

