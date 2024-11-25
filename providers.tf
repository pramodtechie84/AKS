terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.11.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "CTL-RG"
      storage_account_name = "ctltfstate12831"
      container_name       = "ctltfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {
  }
  subscription_id = "d4e13f2d-4e39-47ff-a36d-2ddcc5ebd023"
}
