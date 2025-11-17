param(
    [string]$ResourceGroupName = "git-test-rg",
    [string]$Location = "eastus",
    [string]$StorageAccountName = "demostorageacct123-mike"
)

Write-Host "Logging into Azure..."
az login --service-principal `
    --username $env:AZURE_CLIENT_ID `
    --password $env:AZURE_CLIENT_SECRET `
    --tenant $env:AZURE_TENANT_ID

Write-Host "Setting subscription..."
az account set --subscription $env:AZURE_SUBSCRIPTION_ID

Write-Host "Checking storage account '$StorageAccountName' in resource group '$ResourceGroupName'..."

# Try to get the storage account details
$storage = az storage account show `
    --name $StorageAccountName `
    --resource-group $ResourceGroupName `
    --output json 2>$null | ConvertFrom-Json

if ($storage) {
    Write-Host "✅ Storage account already exists."
    Write-Host "Name: $($storage.name)"
    Write-Host "Location: $($storage.location)"
    Write-Host "SKU: $($storage.sku.name)"
} else {
    Write-Host "⚠️ Storage account not found. Creating new one..."
    az storage account create `
        --name $StorageAccountName `
        --resource-group $ResourceGroupName `
        --location $Location `
        --sku Standard_LRS

    Write-Host "✅ Storage account created successfully."
}
