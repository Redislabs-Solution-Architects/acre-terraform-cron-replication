data "archive_file" "export" {
  type        = "zip"
  source_dir  = "../com.redisgeek.function.acre.export/target/azure-functions/acre-export-function/"
  output_path = "export-function.zip"
}

data "archive_file" "import" {
  type        = "zip"
  source_dir  = "../com.redisgeek.function.acre.import/target/azure-functions/acre-import-function/"
  output_path = "import-function.zip"
}

data "archive_file" "copy" {
  type        = "zip"
  source_dir  = "../com.redisgeek.function.azure.storage.copy/target/azure-functions/azure-storage-copy-function/"
  output_path = "copy-function.zip"
}