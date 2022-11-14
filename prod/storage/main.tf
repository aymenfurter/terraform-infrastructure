module "prod-storage-account" {  
  source               = "git::https://github.com/aymenfurter/terraform_azurerm_storage_account.git?ref=v1.0.1"  

  resource_group_name  = "terraformsample-prod-rg"
  storage_account_name = "terraformsampledata001"

  tags = {
    Environment        = "prod"
    billTo             = "IT-Chargeback-1234"
    managedBy          = "terraform"
    project-name       = "terraform-sample"
    Terraform          = true
  }
}
