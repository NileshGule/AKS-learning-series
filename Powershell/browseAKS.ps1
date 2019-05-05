Param(
    [parameter(Mandatory=$false)]
    [string]$resourceGroupName="techtalksrg",
    [parameter(Mandatory=$false)]
    [string]$clusterName="techtalksCluster"
)

# Browse AKS dashboard
Write-Host "Browse AKS cluster $clusterName" -ForegroundColor Yellow
az aks browse `
--resource-group=$resourceGroupName `
--name=$clusterName