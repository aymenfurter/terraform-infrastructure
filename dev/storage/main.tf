module "dev-storage-account" {  
  source               = "git::https://github.com/aymenfurter/terraform_azurerm_storage_account.git?ref=main"  

  resource_group_name  = "terraformsample-dev-rg"
  storage_account_name = "terraformsampledata001"

  tags = {
    Environment        = "dev"
    billTo             = "IT-Chargeback-1234"
    managedBy          = "terraform"
    project-name       = "terraform-sample"
    Terraform          = true
  }
}
