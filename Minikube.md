# Minikube & Kubectl installation

## Install `Minikube`

Install Minikube https://github.com/kubernetes/minikube/releases

## Install `kubectl`

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

kubectl get all
```