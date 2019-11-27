resource "azurerm_public_ip" "front" {
    name                         = "${terraform.workspace}-front-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "${terraform.workspace}-front-463361681130006683"
}

resource "azurerm_public_ip" "manage" {
    name                         = "${terraform.workspace}-manage-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "${terraform.workspace}-manage-463361681130006683"
}
