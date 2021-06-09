resource "azurerm_redis_enterprise_cluster" "primary" {
  name                = format("redisgeek-%s", random_string.acre_primary_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[0]
  zones               = [1, 2, 3]
  sku_name            = var.acre_sku
  tags                = merge(var.tags)
}

resource "azurerm_redis_enterprise_cluster" "secondary" {
  name                = format("redisgeek-%s", random_string.acre_secondary_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[1]
  zones               = [1, 2, 3]
  sku_name            = var.acre_sku
  tags                = merge(var.tags)
}