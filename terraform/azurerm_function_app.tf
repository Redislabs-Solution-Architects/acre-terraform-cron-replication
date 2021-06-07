resource "azurerm_function_app" "primary_app" {
  name                = "primary-app"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[0]
  app_service_plan_id = azurerm_app_service_plan.primary_plan.id
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"       = "",
    "FUNCTIONS_WORKER_RUNTIME"       = "node",
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.primary.instrumentation_key,
  }
  os_type = "linux"
  site_config {
    linux_fx_version          = "node|14"
    use_32_bit_worker_process = false
  }
  storage_account_name       = azurerm_storage_account.primary.name
  storage_account_access_key = azurerm_storage_account.primary.primary_access_key
  version                    = "~3"

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
    ]
  }
}