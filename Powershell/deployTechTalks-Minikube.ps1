# With the latest reelase of Docker for Mac, there is no need to run Minikube seprately
# Docker has support for single node Kubernetes cluster.

$minikubeStatus = minikube status

Write-Host $minikubeStatus -ForegroundColor Magenta

$IsStopped =$minikubeStatus.Contains("minikube: Stopped")

if($IsStopped)
{
    Write-Host "Starting local minikube cluster" -ForegroundColor Yellow
    minikube start
}

Write-Host "Starting deployment of TechTalks application and services" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube

Write-Host "Creating namespace"  -ForegroundColor Yellow
kubectl apply --filename 00_AKS_Namespace.yml
Write-Host "Namespace created successfully" -ForegroundColor Cyan

Write-Host "Deploying Tech Talks DB service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/TechTalksDB
kubectl apply --recursive --filename . 

Write-Host "Tech talks DB service deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying Tech Talks API service" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/TechTalksAPI
kubectl apply --recursive --filename . 

Write-Host "Tech talks API service deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying Tech Talks web frontend" -ForegroundColor Yellow
Set-Location ~/projects/AKS-learning-series/k8s/Minikube/TechTalksWeb
kubectl apply --recursive --filename . 

Write-Host "Tech talks web frontend deployed successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application have been successfully deployed" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/Powershell