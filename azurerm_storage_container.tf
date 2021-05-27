resource "azurerm_storage_container" "primary" {
  name                  = format("%s", random_string.container_secondary_name.result)
  storage_account_name  = azurerm_storage_account.primary.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "secondary" {
  name                  = format("%s", random_string.container_secondary_name.result)
  storage_account_name  = azurerm_storage_account.secondary.name
  container_access_type = "private"
}