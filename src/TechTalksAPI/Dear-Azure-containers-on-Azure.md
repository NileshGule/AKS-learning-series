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
