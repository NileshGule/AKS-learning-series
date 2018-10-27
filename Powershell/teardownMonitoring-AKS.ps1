Param(
    [parameter(Mandatory=$false)]
    [bool]$ProvisionAKSCluster=$false
)


if($ProvisionAKSCluster)
{
    Write-Host "Provisioning AKS cluster with default parameters" -ForegroundColor Cyan
    & ((Split-Path $MyInvocation.InvocationName) + "\initializeAKS.ps1") 
}

Write-Host "Starting deletion of TechTalks monitoring services" -ForegroundColor Yellow

Write-Host "Deploying Grafana" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/Grafana
kubectl delete --recursive --filename . 

Write-Host "Grafana services deleted successfully" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/k8s/AKS/Prometheus/

Write-Host "Deleting Prometheus"  -ForegroundColor Yellow
kubectl delete --recursive --filename . 

Write-Host "Prometheus related services deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application monitoring have been successfully deleted" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/Powershell