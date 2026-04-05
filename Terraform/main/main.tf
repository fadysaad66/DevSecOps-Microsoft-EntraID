terraform {
  required_version = ">= 1.6.6"
  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "stlabstatestacc123"
    container_name       = "tfstate"
    use_azuread_auth     = true
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.40"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azuread" {}

resource "azurerm_resource_group" "main" {
  name     = local.resourceGroup
  location = local.resourceGroupLocation
  tags     = local.common_tags

  lifecycle {
    ignore_changes = [
      tags["CreatedDate"],
      tags["CreatedBy"]
    ]
  }
}