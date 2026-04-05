# CLI Arguments
variable "pipelineURI" {type = string}
variable "environment" {type = string}
variable "projectName" { type = string }
variable "privilegedUsers" { type = string }
# Environment Arguments
variable "ASPNETCORE_ENVIRONMENT" { type = string }

locals {    
    common_tags = {
      Application = "AzureDemo"
      CreatedDate = timestamp()
      Environment = var.environment
      PipelineURL = var.pipelineURI
      Owner       =  "DevSecOps"
      CreatedBy   =  "DevSecOps"
  }
#backend init
tfResourceGroup= "rg-tf-state"
tfStorage = "stlabstatestacc123"
tfContainer = "tfstate-cruddemo"
acrRegistry = "acrdevsecopslab"
sqlServerGroup = "Azure SQL Server Groups Administrator"
orgResourceGroup = "rg-tf-state"
#tf normal vars
resourceGroup = join("", ["rg-", var.projectName, "-", var.environment])
resourceGroupLocation = "Central US"
fireWallName = join("", ["arc", var.projectName, "-", var.environment])  
keyVaultName = join("", ["akv-", var.projectName, "-", var.environment]) 
webappNameApi = join("",["wa-", var.projectName, "-api-", var.environment])
appServicePlan = join("", ["asp-", var.projectName, "-", var.environment])
sqlserverName = lower( join("", ["sql-", var.projectName, "-", var.environment]))
sqlDBName = lower( join("", ["sqldb-", var.projectName, "-", var.environment]))
}