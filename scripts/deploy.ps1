param(
    [string]$ResourceGroupName = "git-test-rg";
    [string]$Location = "eastus";
    [string]$StorageAccountName = "demostorageacct123";
)

Write-Host "Logging into Azure..."
az login --service-principal `
    --username $env:AZURE_CLIENT_ID `
    --password $env:AZURE_CLIENT_SECRET `
    --tenant $env:AZURE_TENANT_ID

Write-Host "Setting subscription..."
az account set --subscription $env:AZURE_SUBSCRIPTION_ID

Write-Host "Checking existing storage account $StorageAccountName in $ResourceGroupName..."

$storage = az storage account show `
    --name $StorageAccountName `
    --resource-group $ResourceGroupName `
    --output json

if ($storage) {
    Write-Host "Storage account already exists. Details:"
    Write-Host $storage
} else {
    Write-Host "Storage account not found. Please verify name and resource group."
}
