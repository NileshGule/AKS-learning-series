#Helm charts for the AKS learning series

### There are 3 charts available in this repo.

1.  Chart for sqlserver `helm/database`.  This chart uses Kubernetes `Secrets` to stash the secrets.
The values.yaml contains the secret in base64 encoded format.

    ```
    replicaCount: 1
    image:
      repository: microsoft/mssql-server-linux
      tag: latest
      pullPolicy: IfNotPresent
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
      dnsPolicy: ClusterFirst
    
    service:
      type: ClusterIP
      internalPort: 1433
    
    secrets:
      sapassword: SmFudWFyeTIwMTg=
          
    ```
    
    Make sure replicas are set to 1. Currently this image does not support replicas more than 1.
    
    To install using helm, simply execute at the command prompt from `helm/database/` directory.
    
    `helm install --name <your release name> --namespace <your namespace> .`  
    
    Example.
    
    `helm install --name db --namespace techtalks .`.  The `.` at the end specifies the current directory.
    
2.  Chart for the api server.  This chart installs the api server.

    ```    
    replicaCount: 1
    image:
      repository: nileshgule/techtalksapi
      tag: latest
      pullPolicy: IfNotPresent
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
      dnsPolicy: ClusterFirst
    
    initializer_image:
      repository: nileshgule/sqlclient
      tag: latest
    
    service:
      type: ClusterIP
      internalPort: 8080
    
    resources:
      limits:
        memory: 256Mi
        cpu: 1000m
      requests:
        memory: 128Mi
        cpu: 500m
    
    secrets:
      connectionString: RGF0YSBTb3VyY2U9ZGItZGVwbG95bWVudDtJbml0aWFsIENhdGFsb2c9VGVjaFRhbGtzREI7VXNlciBJZD1TQTtQYXNzd29yZD1KYW51YXJ5MjAxODtNdWx0aXBsZUFjdGl2ZVJlc3VsdFNldHM9VHJ1ZQ==
      dbPassword: SmFudWFyeTIwMTg=       
    
     ```
     
     Also noticed that the connectionString is base64 encoded, same as the dbPassword.  Both are loaded into Kuberntes `Secret`.
     
     Please note that the service name is fixed to `techtalksapi`.  
     
     TODO fix the hardcoded instance in the code.
     
     To install, from `helm/techtalksapi/` directory
     
     `helm install --name api --namespace techtalks .`
     
3.  Chart for the web frontend.

    ```
    replicaCount: 1
    image:
      repository: nileshgule/techtalksweb
      tag: latest
      pullPolicy: IfNotPresent
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
      dnsPolicy: ClusterFirst
    
    service:
      type: NodePort
      internalPort: 80
    
    resources:
      limits:
        memory: 256Mi
        cpu: 1000m
      requests:
        memory: 128Mi
        cpu: 500m
        
    ```
    To install, from `helm/techtalksweb/` directory
     
    `helm install --name web --namespace techtalks .`

#### All resources are defaulted to those values.  Adjust accordingly when necessary.

