# just a placeholder for seperate function module
module "dev-function" {  
  source               = "git::https://github.com/aymenfurter/terraform_azurerm_storage_account.git?ref=main"  

  resource_group_name  = "functionterraformsample-dev-rg"
  storage_account_name = "functionterraformsampledata001"

  tags = {
    Environment        = "dev"
    billTo             = "IT-Chargeback-1234"
    managedBy          = "terraform"
    project-name       = "terraform-sample"
    Terraform          = true
  }
}
