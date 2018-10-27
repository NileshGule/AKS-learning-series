# Commands used during AKS Part 5 Hands on Demo

## Docker debugging

### Docker container logs

```bash

docker logs

```

### Docker Inspect Container

```bash

docker inspect


```

### Attach to running container

```bash

docker attach 

```

### Container resource usage

```bash

docker stats

```

### Running processes

```bash

docker top 

```

## Kubernetes debugging

### Cluster info

```bash

kubectl config view

```

### Get current context

```bash

kubectl config current-context

```

kubectl get services

kubectl get services --namespace aks-part4

kubectl get pods --namespace aks-part4

kubectl get pods --namespace aks-part4 --include-uninitialized

kubectl describe nodes aks-nodepool1-99012362-1

kubectl describe pod --namespace aks-part4 techtalksweb-858d956d68-pzlks

