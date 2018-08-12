# Azure Kubernetes Service (AKS) Learning Series

Demo code for Hands on Series for `Azure kubernetes Series (AKS) learning series`. 

## Code organization

- `Docker-compose V1`

Contains the docker-compose file in its simplest form

- `Docker-compose V2`

Contains the docker-compose files split into a base compose file and separate files for build and run scenarios

- `k8s`

Contains Kubernetes Manifest files

- `powershell`

Contains the powershell scripts used for deploying application resources to Minikube or AKS cluster

- `src`

Contains the source code.
    
    - `TechTalksAPI` contains code for Web API project

    - `TechTalksDB` contains database initialization script

    - `TechTalksWeb` contains code for ASP.Net Core MVC frontend

- `Minikube`

Contains instructions for setting up `Minikube` cluster and `Kubectl`