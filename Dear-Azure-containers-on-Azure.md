# Command related to Dear Azure Community event

## Docker

```
docker --help

docker info

docker ps

docker images

docker image pull alpine

docker run alpine

docker container run alpine ls -l

docker run -it alpine

docker inspect <<container name>>

docker history <<image name>>

docker container ls

docker container ls -a

docker system prune

```

## SQL Server container commands

```
docker run `
--name sql2017 `
-e 'ACCEPT_EULA=Y' `
-e 'SA_PASSWORD=October@2020' `
-p 1433:1433 `
-d microsoft/mssql-server-linux


```

SQL Server 2019 with port mapping

```

docker run `
--name sql2019 `
-e 'ACCEPT_EULA=Y' `
-e 'SA_PASSWORD=October@2020' `
-e 'MSSQL_AGENT_ENABLED=true' `
-p 1444:1433 `
-d mcr.microsoft.com/mssql/server:2019-CU8-ubuntu-18.04

```

### Build docker image

```

docker build . -t nileshgule/techtalksweb

docker run --name techtalksweb nileshgule/techtalksweb --memory="750m"

docker run --name techtalksweb nileshgule/techtalksweb:v2 --memory="750m"

```

### Build multiple images using Docker compose

```

docker-compose -f docker-compose.yml -f docker-compose-build.yml build

docker-compose -f docker-compose.yml -f docker-compose-run.yml up

docker-compose -f docker-compose.yml -f docker-compose-build.yml down

```

## Docker ACI integration

```
docker login azure

docker context --help

docker context list

docker context create aci acicontext

docker --context acicontext run -p 80:80 nginx

docker --context acicontext `
run `
--name techtalksweb `
-e 'ASPNETCORE_ENVIRONMENT=Development' `
-e 'TechTalksAPIUrl=http://techtalksapi:8080/api/techtalks/' `
-p 80:80 ngacrregistry.azurecr.io/nileshgule/techtalksweb

```

## Build Containers using ACR

```

az acr build --image nileshgule/techtalksweb `
  --registry ngacrregistry `
  --file Dockerfile .

```

## ACI image deployment using Az CLI

```

$acrUserPassword = az acr credential show `
    --name ngacrregistry `
    --query "passwords[0].value"

az container create `
    --name aci-demo `
    --resource-group aci-resource-group `
    --image ngacrregistry.azurecr.io/nileshgule/techtalksweb `
	--dns-name-label aci-demo-techtalksweb `
    --query ipAddress.fqdn

```
