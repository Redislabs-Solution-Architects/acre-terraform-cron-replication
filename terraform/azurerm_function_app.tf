resource "azurerm_function_app" "export" {
  name                = format("export-%s", random_string.export_function_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[0]
  app_service_plan_id = azurerm_app_service_plan.primary_plan.id
  app_settings = {
    "AzureWebJobsStorage" : "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.primary.name};AccountKey=${azurerm_storage_account.primary.primary_access_key};EndpointSuffix=core.windows.net",
    "WEBSITE_RUN_FROM_PACKAGE" : "https://${azurerm_storage_account.primary.name}.blob.core.windows.net/${azurerm_storage_container.primary.name}/${azurerm_storage_blob.export.name}${data.azurerm_storage_account_sas.primary.sas}",
    "FUNCTIONS_WORKER_RUNTIME" : "java",
    "FUNCTIONS_EXTENSION_VERSION" : "~3",
    "APPINSIGHTS_INSTRUMENTATIONKEY" : azurerm_application_insights.export.instrumentation_key,
    "acre_id" : azurerm_redis_enterprise_cluster.primary.id,
    "rg_name" : azurerm_resource_group.resource_group.name,
    "blobSas" : data.azurerm_storage_account_blob_container_sas.primary.sas,
    "storageKey" : azurerm_storage_account.primary.primary_access_key,
    "storageAccountName" : azurerm_storage_account.primary.name,
    "storageContainerName" : azurerm_storage_container.primary.name,
    "AZURE_SUBSCRIPTION_ID" : data.azurerm_client_config.current.subscription_id,
    "AZURE_TENANT_ID" : data.azurerm_client_config.current.tenant_id,
    "AZURE_CLIENT_ID" : data.azurerm_client_config.current.client_id,
    "AZURE_CLIENT_SECRET" : urlencode(var.AZURE_CLIENT_SECRET)
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

resource "azurerm_function_app" "copy" {
  name                = format("copy-%s", random_string.export_function_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[0]
  app_service_plan_id = azurerm_app_service_plan.primary_plan.id
  app_settings = {
    "AzureWebJobsStorage" : "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.primary.name};AccountKey=${azurerm_storage_account.primary.primary_access_key};EndpointSuffix=core.windows.net",
    "WEBSITE_RUN_FROM_PACKAGE" : "https://${azurerm_storage_account.primary.name}.blob.core.windows.net/${azurerm_storage_container.primary.name}/${azurerm_storage_blob.copy.name}${data.azurerm_storage_account_sas.primary.sas}",
    "FUNCTIONS_WORKER_RUNTIME" : "java",
    "FUNCTIONS_EXTENSION_VERSION" : "~3",
    "APPINSIGHTS_INSTRUMENTATIONKEY" : azurerm_application_insights.copy.instrumentation_key,
    "targetBlobSas" : data.azurerm_storage_account_blob_container_sas.secondary.sas,
    "targetStorageAccountUrl" : azurerm_storage_account.secondary.primary_blob_endpoint,
    "AZURE_SUBSCRIPTION_ID" : data.azurerm_client_config.current.subscription_id,
    "AZURE_TENANT_ID" : data.azurerm_client_config.current.tenant_id,
    "AZURE_CLIENT_ID" : data.azurerm_client_config.current.client_id,
    "AZURE_CLIENT_SECRET" : urlencode(var.AZURE_CLIENT_SECRET)
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

resource "azurerm_function_app" "import" {
  name                = format("import-%s", random_string.export_function_name.result)
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = random_shuffle.regions-with-az.result[1]
  app_service_plan_id = azurerm_app_service_plan.secondary_plan.id
  app_settings = {
    "AzureWebJobsStorage" : "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.secondary.name};AccountKey=${azurerm_storage_account.secondary.primary_access_key};EndpointSuffix=core.windows.net",
    "WEBSITE_RUN_FROM_PACKAGE" : "https://${azurerm_storage_account.secondary.name}.blob.core.windows.net/${azurerm_storage_container.secondary.name}/${azurerm_storage_blob.import.name}${data.azurerm_storage_account_sas.secondary.sas}",
    "FUNCTIONS_WORKER_RUNTIME" : "java",
    "FUNCTIONS_EXTENSION_VERSION" : "~3",
    "APPINSIGHTS_INSTRUMENTATIONKEY" : azurerm_application_insights.import.instrumentation_key,
    "acre_id" : azurerm_redis_enterprise_cluster.secondary.id,
    "rg_name" : azurerm_resource_group.resource_group.name,
    "blobSas" : data.azurerm_storage_account_blob_container_sas.secondary.sas,
    "storageKey" : azurerm_storage_account.secondary.primary_access_key,
    "storageAccountName" : azurerm_storage_account.secondary.name,
    "AZURE_SUBSCRIPTION_ID" : data.azurerm_client_config.current.subscription_id,
    "AZURE_TENANT_ID" : data.azurerm_client_config.current.tenant_id,
    "AZURE_CLIENT_ID" : data.azurerm_client_config.current.client_id,
    "AZURE_CLIENT_SECRET" : urlencode(var.AZURE_CLIENT_SECRET)
  }
  os_type = "linux"
  site_config {
    linux_fx_version          = "java|11"
    use_32_bit_worker_process = false
  }
  storage_account_name       = azurerm_storage_account.secondary.name
  storage_account_access_key = azurerm_storage_account.secondary.primary_access_key
  version                    = "~3"
}