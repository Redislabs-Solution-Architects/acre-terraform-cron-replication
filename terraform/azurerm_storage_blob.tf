resource "azurerm_storage_blob" "storage_blob" {
  name                   = "export-function.zip"
  storage_account_name   = azurerm_storage_account.primary.name
  storage_container_name = azurerm_storage_container.primary.name
  type                   = "Block"
  source                 = "../com.redisgeek.function.acre.export/export-0.0.1.jar"
}