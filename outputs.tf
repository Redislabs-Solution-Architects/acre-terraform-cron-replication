locals {
  redisgeek_config = {
    resource_group_name = azurerm_resource_group.resource_group.name
  }
  primary_info = {
    hostname   = azurerm_redis_enterprise_cluster.primary.hostname
    access_key = azurerm_redis_enterprise_database.primary.primary_access_key
  }
  secondary_info = {
    hostname   = azurerm_redis_enterprise_cluster.secondary.hostname
    access_key = azurerm_redis_enterprise_database.secondary.primary_access_key
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