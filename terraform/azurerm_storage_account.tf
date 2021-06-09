resource "azurerm_storage_account" "primary" {
  name                     = format("primary%s", random_string.storage_primary_name.result)
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = random_shuffle.regions-with-az.result[0]
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(var.tags)
}

resource "azurerm_storage_account" "secondary" {
  name                     = format("secondary%s", random_string.storage_secondary_name.result)
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = random_shuffle.regions-with-az.result[1]
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(var.tags)
}
