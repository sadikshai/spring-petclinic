terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "storage"
    storage_account_name = "lttfbackedforworkshop"
    container_name       = "workshop-state"
    key                  = "workshop.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "48779e5a-57d5-432c-8ddf-d51b82b18f09"
  features {

  }
}