param(
    [string]$ResourceGroupName = "git-test-rg",
    [string]$Location = "eastus",
    [string]$StorageAccountName = "demostorageacct123"
)

Write-Host "Logging into Azure..."
az login --service-principal `
    --username $env:AZURE_CLIENT_ID `
    --password $env:AZURE_CLIENT_SECRET `
    --tenant $env:AZURE_TENANT_ID

Write-Host "Setting subscription..."
az account set --subscription $env:AZURE_SUBSCRIPTION_ID

Write-Host "Deploying storage account $StorageAccountName into $ResourceGroupName..."
az storage account create `
    --name $StorageAccountName `
    --resource-group $ResourceGroupName `
    --location $Location `
    --sku Standard_LRS
