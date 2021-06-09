variable "acre_capacity" {
  type    = number
  default = 2
}

variable "acre_client_protocol" {
  type    = string
  default = "Encrypted"
}

variable "acre_cluster_policy" {
  type    = string
  default = "EnterpriseCluster"
}

variable "acre_eviction_policy" {
  type    = string
  default = "NoEviction"
}

variable "acre_sku" {
  type    = string
  default = "Enterprise_E10-2"
}

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  default     = "public"
  type        = string
}

variable "tags" {
  description = "Key/value tags to assign to all resources."
  default     = {}
  type        = map(string)
}

variable "AZURE_CLIENT_SECRET" {
  type = string
}