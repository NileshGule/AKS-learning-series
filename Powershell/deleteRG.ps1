Param(
    [parameter(Mandatory=$false)]
    [string]$resourceGroupName="aksP4ResourceGroup"
)

# Delete AKS cluster
Write-Host "Deleting resource group $resourceGroupName" -ForegroundColor Red
time az group delete --name=$resourceGroupName --yes