locals {
  redisgeek_config = {
    resource_group_name = azurerm_resource_group.resource_group.name
  }
  primary_info = {
    id                        = azurerm_redis_enterprise_cluster.primary.id
    hostname                  = azurerm_redis_enterprise_cluster.primary.hostname
    access_key                = azurerm_redis_enterprise_database.primary.primary_access_key
    database_id               = azurerm_redis_enterprise_database.primary.id
    storage_account           = azurerm_storage_account.primary.name
    storage_account_endpoint  = azurerm_storage_account.primary.primary_blob_endpoint
    storage_container         = azurerm_storage_container.primary.name
    storage_connection_string = azurerm_storage_account.primary.primary_blob_connection_string
    storage_key               = azurerm_storage_account.primary.primary_access_key
    blob_sas                  = data.azurerm_storage_account_blob_container_sas.primary.sas
  }
  secondary_info = {
    account_sas               = data.azurerm_storage_account_sas.primary.sas
    id                        = azurerm_redis_enterprise_cluster.secondary.id
    hostname                  = azurerm_redis_enterprise_cluster.secondary.hostname
    access_key                = azurerm_redis_enterprise_database.secondary.primary_access_key
    database_id               = azurerm_redis_enterprise_database.secondary.id
    storage_account           = azurerm_storage_account.secondary.name
    storage_account_endpoint  = azurerm_storage_account.secondary.primary_blob_endpoint
    storage_container         = azurerm_storage_container.secondary.name
    storage_connection_string = azurerm_storage_account.secondary.primary_blob_connection_string
    storage_key               = azurerm_storage_account.secondary.primary_access_key
    blob_sas                  = data.azurerm_storage_account_blob_container_sas.secondary.sas
  }
}

output "redisgeek_config" {
  value     = jsonencode(local.redisgeek_config)
  sensitive = true
}

output "primary_info" {
  value     = jsonencode(local.primary_info)
  sensitive = true
}

output "secondary_info" {
  value     = jsonencode(local.secondary_info)
  sensitive = true
}