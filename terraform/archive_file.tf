data "archive_file" "export" {
  type        = "zip"
  source_dir  = "../com.redisgeek.function.acre.export/target/azure-functions/acre-export-function/"
  output_path = "export-function.zip"
}