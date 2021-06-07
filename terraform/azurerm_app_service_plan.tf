resource "azurerm_app_service_plan" "primary_plan" {
  name                = "primary-plan"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[0]
  kind                = "elastic"
  reserved            = true
  sku {
    tier = "ElasticPremium"
    size = "EP1"
  }
}

resource "azurerm_app_service_plan" "secondary_plan" {
  name                = "secondary-plan"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[1]
  kind                = "elastic"
  reserved            = true
  sku {
    tier = "ElasticPremium"
    size = "EP1"
  }
}