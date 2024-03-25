# modules/network/main.tf

resource "azurerm_virtual_network" "vnet" {
    name                = "${var.environment}-network"
    location            = var.region
    resource_group_name = azurerm_resource_group.rg.name
    address_space       = ["10.0.0.0/16"]
}