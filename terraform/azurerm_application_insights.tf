resource "azurerm_application_insights" "copy" {
  name                = format("copy-%s", random_string.copy_function_name.result)
  location            = random_shuffle.regions-with-az.result[0]
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = "java"
  depends_on          = [azurerm_app_service_plan.primary_plan]
}

resource "azurerm_application_insights" "export" {
  name                = format("export-%s", random_string.export_function_name.result)
  location            = random_shuffle.regions-with-az.result[0]
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = "java"
  depends_on          = [azurerm_app_service_plan.primary_plan]
}

resource "azurerm_application_insights" "import" {
  name                = format("import-%s", random_string.import_function_name.result)
  location            = random_shuffle.regions-with-az.result[1]
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = "java"
  depends_on          = [azurerm_app_service_plan.secondary_plan]
}