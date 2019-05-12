Param(
    [parameter(Mandatory=$false)]
    [bool]$ProvisionAKSCluster=$false,
    [parameter(Mandatory=$false)]
    [string]$NamespaceName="ag1"
)


if($ProvisionAKSCluster)
{
    Write-Host "Provisioning AKS cluster with default parameters" -ForegroundColor Cyan
    & ((Split-Path $MyInvocation.InvocationName) + "\initializeAKS.ps1") 
}

Write-Host "Starting deployment of TechTalks application and services" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/

Write-Host "Creating namespace"  -ForegroundColor Yellow
kubectl apply --filename 00_AKS_Namespace.yml
Write-Host "Namespace created successfully" -ForegroundColor Cyan

Write-Host "Deploying Tech Talks DB service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksDB2019

Write-Host "Deploying SQL Server Operator" -ForegroundColor Yellow
# kubectl apply --filename 00_operator.yml 
kubectl apply `
--filename 00_operator.yml `
--namespace $NamespaceName

Write-Host "SQL Server Operator deployed successfully" -ForegroundColor Cyan

Write-Host "Creating SA password" -ForegroundColor Yellow
# kubectl apply --filename 01_sa-password.yml
kubectl create `
secret generic sql-secrets `
--from-literal=sapassword="P@ssw0rd!" `
--from-literal=masterkeypassword="P@ssw0rd!"  `
--namespace $NamespaceName

Write-Host "Storage class created successfully" -ForegroundColor Cyan

Write-Host "Deploying SQL Server custom resource" -ForegroundColor Yellow
# kubectl apply --filename 04_sqlserver.yml
kubectl apply `
--filename 04_sqlserver.yml `
--namespace $NamespaceName

Write-Host "SQL Server custom resource deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying SQL Server Availability Group" -ForegroundColor Yellow
# kubectl apply --filename 04_sqlserver.yml
kubectl apply `
--filename 04_agservices.yml `
--namespace $NamespaceName

Write-Host "SQL Server Availability Group deployed successfully" -ForegroundColor Cyan


Write-Host "Tech talks DB service deployed successfully" -ForegroundColor Cyan

# Write-Host "Deploying Tech Talks API service" -ForegroundColor Yellow
# Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksAPI
# kubectl apply --recursive --filename . 

# Write-Host "Tech talks API service deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying Tech Talks web frontend" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksWeb

kubectl apply `
--recursive `
--filename . `
--namespace $NamespaceName

Write-Host "Tech talks web frontend deployed successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application have been successfully deployed" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/Powershell