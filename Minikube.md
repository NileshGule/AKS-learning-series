# Minikube & Kubectl installation

## Install `Minikube`

Install Minikube https://github.com/kubernetes/minikube/releases

## Install `kubectl`

## Get supported version

```bash

minikube get-k8s-versions

```

## Get list of existing contexts

```bash

kubectl config get-contexts

```

## Switch the context to `docker-for-desktop`

```bash

kubectl config use-context docker-for-desktop

```

## Get cluster info

```bash

kubectl cluster-info

```

## Get All Kubernetes objects

```bash

kubectl get all

```

## Get service url using namespace

```bash

minikube service -n aks-part3 --url webfront

```

## Other kubectl commands

```bash

kubectl describe service --namespace aks-part3

kubectl describe service --n aks-part3

kubectl get pods --namespace aks-part3

kubectl delete --filename web-service.yml

```