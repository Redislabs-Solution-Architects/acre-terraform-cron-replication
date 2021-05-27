resource "azurerm_redis_enterprise_database" "primary" {
  name                = "default"
  resource_group_name = azurerm_resource_group.resource_group.name
  cluster_id          = azurerm_redis_enterprise_cluster.primary.id
  clustering_policy   = var.acre_cluster_policy
}

resource "azurerm_redis_enterprise_database" "secondary" {
  name                = "default"
  resource_group_name = azurerm_resource_group.resource_group.name
  cluster_id          = azurerm_redis_enterprise_cluster.primary.id
  clustering_policy   = var.acre_cluster_policy
}