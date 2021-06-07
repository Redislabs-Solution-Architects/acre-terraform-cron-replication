terraform {
  required_version = ">= 0.15.4"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.60.0"
    }
  }
}
