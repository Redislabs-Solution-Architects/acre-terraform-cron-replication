data "azurerm_storage_account_blob_container_sas" "primary" {
  connection_string = azurerm_storage_account.primary.primary_connection_string
  container_name    = azurerm_storage_container.primary.name
  https_only        = true

  start  = "2021-06-01"
  expiry = "2021-06-01"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}

data "azurerm_storage_account_blob_container_sas" "secondary" {
  connection_string = azurerm_storage_account.secondary.primary_connection_string
  container_name    = azurerm_storage_container.secondary.name
  https_only        = true

  start  = "2021-06-01"
  expiry = "2021-06-01"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}