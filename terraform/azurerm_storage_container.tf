resource "azurerm_storage_container" "primary" {
  name                  = "redisgeek-source"
  storage_account_name  = azurerm_storage_account.primary.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "secondary" {
  name                  = "redisgeek-target"
  storage_account_name  = azurerm_storage_account.secondary.name
  container_access_type = "private"
}