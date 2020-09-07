# configure backend to keep terraform state
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-norbi-terraform"
    storage_account_name = "norbisaterraform"
    container_name       = "norbitfstate"
    key                  = "terraform.dev.tfstate"
  }
}
