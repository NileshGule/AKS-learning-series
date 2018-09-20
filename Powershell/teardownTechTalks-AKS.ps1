Write-Host "Starting deletion of TechTalks application and services" -ForegroundColor Yellow

Write-Host "Deleting Tech Talks web frontend" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksWeb
kubectl delete --recursive --filename . 

Write-Host "Tech talks web frontend deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks API service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksAPI
kubectl delete --recursive --filename . 

Write-Host "Tech talks API service deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks DB service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksDB
kubectl delete --recursive --filename . 

Write-Host "Tech talks DB service deleted successfully" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/k8s/AKS/

Write-Host "Deleting Persistant Volume Claim" -ForegroundColor Yellow
kubectl delete --filename 02_PersistantVolumeClaim.yml
Write-Host "Persistant Volume Claim deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting storage class" -ForegroundColor Yellow
kubectl delete --filename 01_StorageClass.yml
Write-Host "Storage class deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting namespace"  -ForegroundColor Yellow
kubectl delete --filename 00_AKS_Namespace.yml
Write-Host "Namespace deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application have been successfully deleted" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/Powershell/