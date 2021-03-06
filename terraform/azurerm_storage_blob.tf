resource "azurerm_storage_blob" "export" {
  name                   = "export-function.zip"
  storage_account_name   = azurerm_storage_account.primary.name
  storage_container_name = azurerm_storage_container.primary.name
  type                   = "Block"
  source                 = "export-function.zip"
}

resource "azurerm_storage_blob" "copy" {
  name                   = "copy-function.zip"
  storage_account_name   = azurerm_storage_account.primary.name
  storage_container_name = azurerm_storage_container.primary.name
  type                   = "Block"
  source                 = "copy-function.zip"
}

resource "azurerm_storage_blob" "import" {
  name                   = "import-function.zip"
  storage_account_name   = azurerm_storage_account.secondary.name
  storage_container_name = azurerm_storage_container.secondary.name
  type                   = "Block"
  source                 = "import-function.zip"
}