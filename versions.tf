terraform {
  required_version = ">= 0.12.26"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.90"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
}
