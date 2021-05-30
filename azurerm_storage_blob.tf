//resource "azurerm_storage_blob" "storage_blob" {
//  name = "${filesha256(var.archive_file.output_path)}.zip"
//  storage_account_name = azurerm_storage_account.storage_account.name
//  storage_container_name = azurerm_storage_container.storage_container.name
//  type = "Block"
//  source = var.archive_file.output_path
//}