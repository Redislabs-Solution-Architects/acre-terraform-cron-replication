resource "azurerm_function_app" "export" {
  name                = format("export-%s", random_string.export_function_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[0]
  app_service_plan_id = azurerm_app_service_plan.primary_plan.id
  app_settings = {
    "AzureWebJobsStorage" : "",
    "WEBSITE_RUN_FROM_PACKAGE"    = "https://${azurerm_storage_account.primary.name}.blob.core.windows.net/${azurerm_storage_container.primary.name}/${azurerm_storage_blob.storage_blob.name}${data.azurerm_storage_account_blob_container_sas.primary.sas}",
    "FUNCTIONS_WORKER_RUNTIME"       = "java",
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.primary.instrumentation_key,
    "AzureWebJobsDisableHomepage"    = "false"
    "MAIN_CLASS" : "com.redisgeek.function.acre.export.Application",
    "acre_id" : azurerm_redis_enterprise_cluster.primary.id,
    "rg_name" : azurerm_resource_group.resource_group.name,
    "blobSas" : data.azurerm_storage_account_blob_container_sas.primary.sas,
    "storageKey" : azurerm_storage_account.primary.primary_access_key,
    "storageName" : azurerm_storage_account.primary.name,
    "storageContainerName" : azurerm_storage_container.primary.name,
    "AZURE_SUBSCRIPTION_ID" : data.azurerm_client_config.current.subscription_id,
    "AZURE_TENANT_ID" : data.azurerm_client_config.current.tenant_id,
    "AZURE_CLIENT_ID" : data.azurerm_client_config.current.client_id,
    "AZURE_CLIENT_SECRET" : var.AZURE_CLIENT_SECRET
  }
  os_type = "linux"
  site_config {
    linux_fx_version          = "java|11"
    use_32_bit_worker_process = false
  }
  storage_account_name       = azurerm_storage_account.primary.name
  storage_account_access_key = azurerm_storage_account.primary.primary_access_key
  version                    = "~3"
}