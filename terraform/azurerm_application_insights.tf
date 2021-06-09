resource "azurerm_application_insights" "primary" {
  name                = format("primary-%s", random_string.export_function_name.result)
  location            = random_shuffle.regions-with-az.result[0]
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = "java"
}