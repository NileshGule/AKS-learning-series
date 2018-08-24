Write-Host "Starting deletion of TechTalks application and services" -ForegroundColor Yellow

Write-Host "Deleting Tech Talks web frontend" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/TechTalksWeb
kubectl delete --recursive --filename . 

Write-Host "Tech talks web frontend deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks API service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/TechTalksAPI
kubectl delete --recursive --filename . 

Write-Host "Tech talks API service deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks DB service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/TechTalksDB
kubectl delete --recursive --filename . 

Write-Host "Tech talks DB service deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting namespace"  -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/
kubectl delete --filename 00_AKS_Namespace.yml
Write-Host "Namespace deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application have been successfully deployed" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/Powershell