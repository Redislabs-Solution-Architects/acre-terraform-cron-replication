data "azurerm_storage_account_sas" "primary" {
  connection_string = azurerm_storage_account.primary.primary_connection_string
  https_only        = true
  start             = "2021-06-01"
  expiry            = "2022-06-30"
  resource_types {
    object    = true
    container = false
    service   = false
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}

data "azurerm_storage_account_sas" "secondary" {
  connection_string = azurerm_storage_account.secondary.primary_connection_string
  https_only        = true
  start             = "2021-06-01"
  expiry            = "2022-06-30"
  resource_types {
    object    = true
    container = false
    service   = false
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}