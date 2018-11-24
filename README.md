# Azure Kubernetes Service (AKS) Learning Series

Demo code for Hands on Series for `Azure kubernetes Series (AKS) learning series`. The series is delivered as part of Azure Learning Series for the Microsoft Azure user group in Singapore. The objective of this series is to learn about containerizing multi-container application using Docker. The multi-container application is then deployed to a managed Kubernetes cluster using Azure Kubernetes Service.

## Application Overview

![application overview](/Images/App-overview.png)

The application makes use of ASP.Net Core for building a MVC front end. It is an application for managing hypothetical events for TechTalks. The front end interacts with an backend ASP.Net Core API. SQL Server 2017 provides the persistent storage. All these 3 components are containerized using Docker.

The application is deployed to Azure Kubernetes Service (AKS) cluster in a multinode environment.

![AKS resources](/Images/AKS-resources.png)

We used `Azure Disk` to manage database state using `Persistent Volume` and `Persistent Volume Claim`. Finally we used `Azure Monitoring` to monitor the cluster state and also an open source solution with `Prometheus` and `Grafana` as an alternative to Azure Monitor.

Here is an example of Grafana dashboard for Kubernetes Capacity Planning
![AKS resources](/Images/Grafana-dashboard1.png)

Grafana dashboard for pod utilization
![AKS resources](/Images/grafana-podutilization.png)

## Code organization

- `Docker-compose V1`

Contains the docker-compose file in its simplest form

- `Docker-compose V2`

Contains the docker-compose files split into a base compose file and separate files for build and run scenarios. This is a preferred approach as it allows to have clear separation in terms of images which are built as part of application code and images which are used from other pre-built images. This also allows us to separate configurations between different environments like Dev / Integration / Production etc.

- `Helm`

Contains the Helm charts which are useful for deploying Kubernetes applications. Refer to the [Helm readme](/helm/Readme.md) file for more details.

- `k8s`

Contains Kubernetes Manifest files. These are grouped into `Minikube` version with services exposed using `NodePort` type. `AKS` version exposes the `TechTalksWeb` and `TechTalksDB` using LoadBalancer. The data is also persisted to outside of the container using `Persistent Volume (PV)` and `Persistent Volume Claim (PVC)`. The volume is backed by `Azure Disk`.

AKS version contians the Kubernetes Manifest files for deploying `Prometheus` and `Grafana` resources to the AKS cluster. These are used for monitoring the AKS cluster.

- `Powershell`

Contains the powershell scripts used for deploying application resources to Minikube or AKS cluster

- `Skaffold`

[Skaffold](https://github.com/GoogleContainerTools/skaffold) adds ability to do continuous deployment of Kubernetes application. This is similar to live unit testing feature. Refer to the two links below to know more about using Skaffold.

1 - Use [Skaffold with Minikube](https://www.handsonarchitect.com/2018/08/continuous-kubernetes-deployments-with.html)

2 - Use [Skaffold with Docker for Mac with Kubernetes](https://www.handsonarchitect.com/2018/08/continuous-kubernetes-deployments-with.html)

- `src`

Contains the source code.
    
    - `TechTalksAPI` contains code for Web API project

    - `TechTalksDB` contains database initialization script

    - `TechTalksWeb` contains code for ASP.Net Core MVC frontend

- `Minikube`

Contains instructions for setting up `Minikube` cluster and `Kubectl`

## Setup Development environment

The project is based on .Net Core 2.1 framework. The application is built using Docker Multi-Stage builds and does not require the base machine to have .Net Core or runtime to be installed. It is recommended to install .Net Core framework locally on the machine if you wish to debug the code.

### Mac and CLI resources

This project was initially started with Mac and cross platform resources for .Net Core development including
- Visual Studio Code
- iTerm 2
- Powershell
- Docker for Mac

### Windows 10 and CLI resources

The application can be tested on Windows 10 using tools listed below
- Visual Studio Code
- Powershell
- Docker for Windows

### Windows 10 and Visual Studio 2017

For some people it is unimaginable to work our of Visual Studio.You can replace Visual Studio Code with Visual Studio 2017 as the preferred IDE.

## Online resources

The Azure Kubernetes Service (AKS) Learning Series is recorded and videos are available on Engineers.sg website. 

- AKS Part 1 - Getting started with Docker

[![Getting started with Docker](/Images/AKS-Part1.PNG)](https://engineers.sg/video/azure-container-service-aks-part-1-gettin-started-with-docker-by-nilesh-gule--2732)

- AKS Part 2 - Stitch multiple containers using Docker Compose

[![Stitch multiple containers using Docker Compose](/Images/AKS-Part2.png)](https://www.engineers.sg/video/azure-kubernetes-service-aks-2-stitch-multi-container-apps-with-docker-compose--2814)

- AKS Part 3 - Container Orchestration using Kubernetes / Minikube

[![Container Orchestration using Kubernetes / Minikube](/Images/AKS-Part3.png)](https://engineers.sg/video/orchestrating-containers-using-minikube--2849)

- AKS Part 4 - Deploy Multi-container Apps to Azure Kubernetes Service (AKS)]

[![Deploy Multi-container Apps to Azure Kubernetes Service (AKS)](/Images/AKS-Part4.png)](https://www.engineers.sg/video/aks-learning-series-4-multi-container-apps-via-aks--2880)

- AKS Part 5 - Debug and Monitor Multi-container Apps running on Azure Kubernetes Service (AKS)

[![Debug and Monitor Multi-container Apps running on Azure Kubernetes Service (AKS)](/Images/AKS-Part5.png)](https://engineers.sg/video/monitor-aks-cluster-with-container-monitoring-solution-using-oms--2957)

- AKS Part 6 - CI CD with Docker and Kubernetes using Azure DevOps

[![CI CD with Docker and Kubernetes using Azure DevOps](/Images/AKS-Part6.png)](https://www.engineers.sg/video/azure-learning-series-azure-container-service-part-6--2986)

## Slides at Slideshare

- [AKS Part 1 - Getting started with Docker](https://www.slideshare.net/nileshgule/azure-kubernetes-service-aks-part-1)
- [AKS Part 2 - Stitch multiple containers using Docker compose](https://www.slideshare.net/nileshgule/azure-kubernetes-service-aks-part-2-stitch-multi-container-apps-using-docker-compose)
- [AKS Part 3 - Container Orchestration using Kubernetes / Minikube](https://www.slideshare.net/nileshgule/azure-kubernetes-service-aks-part-3-110006705)
- [AKS Part 4 - Deploy Multi-container Apps to Azure Kubernetes Service (AKS)](https://www.slideshare.net/nileshgule/azure-kubernetes-service-aks-part-4-deploy-multicontainer-app-to-aks-cluster)
- [AKS Part 5 - Debug and Monitor Multi-container Apps on Azure Kubernetes Service (AKS)](https://www.slideshare.net/nileshgule/debug-and-monitor-multicontainer-apps-on-aks)
- [AKS Part 6 - CI CD with Docker and Kubernetes with Azure DevOps](https://www.slideshare.net/nileshgule/ci-cd-with-docker-and-kubernetes)

## Slides at Speakerdeck

- [AKS Part 1 - Getting started with Docker](https://speakerdeck.com/nileshgule/azure-kubernetes-service-learning-series-part-1-docker)
- [AKS Part 2 - Stitch multiple containers using Docker compose](https://speakerdeck.com/nileshgule/stitch-multi-container-apps-using-docker-compose)
- [AKS Part 3 - Container Orchestration using Kubernetes / Minikube](https://speakerdeck.com/nileshgule/container-orchestration-using-kubernetes)
- [AKS Part 4 - Deploy Multi-container Apps to Azure Kubernetes Service (AKS)](https://speakerdeck.com/nileshgule/aks-learning-series-deploy-multi-container-apps-to-azure-kubernetes-service-aks)
- [AKS Part 5 - Debug and Monitor Multi-container Apps on Azure Kubernetes Service (AKS)](https://speakerdeck.com/nileshgule/debug-and-monitor-multi-container-apps)
- [AKS Part 6 - CI CD with Docker and Kubernetes with Azure DevOps](https://speakerdeck.com/nileshgule/ci-cd-using-docker-and-kubernetes)