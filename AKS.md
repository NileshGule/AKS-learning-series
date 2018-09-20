# Commands for Learning AKS series Part 4

## Azure AKS

### Get list of supported Kubernetes versions

```bash

az aks get-versions --location "South East Asia" -o table

```

### Provision AKS cluster

```powershell

initializeAKS.ps1

```

### Get node info

```bash

kubectl --namespace aks-part4 get pods

```

## Kubernetes deployment

### Deploy TechTalk application

```powershell

deployTechTalks-AKS.ps1

```

### Describe wefront

```bash

kubectl --namespace aks-part4 describe service webfront

```

### Describe api

```bash

kubectl --namespace aks-part4 describe service techtalksapi

```

### Describe PV

```bash

kubectl --namespace aks-part4 describe pv

```

### Describe PVC

```bash

kubectl --namespace aks-part4 describe pvc

```