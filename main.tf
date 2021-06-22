terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.project_name}-rg"
  location = var.location
}

module "sql" {
  source       = "./sql"
  project_name = var.project_name
  group_name   = azurerm_resource_group.main.name
  location     = var.location
}
