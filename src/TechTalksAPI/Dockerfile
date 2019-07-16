FROM microsoft/dotnet:2.1.300-sdk  AS build-env


WORKDIR /TechTalksAPI
COPY NuGet.config ./
COPY TechTalksAPI.csproj ./


RUN dotnet restore

COPY . ./

RUN dotnet publish --configuration Release --output releaseOutput --no-restore

#build runtime image
FROM microsoft/dotnet:2.1.0-aspnetcore-runtime

#required only in case of docker-compose to set the port for ASPNETCORE_URLS
# ENV ASPNETCORE_URLS http://+:8081

WORKDIR /TechTalksAPI

COPY --from=build-env /TechTalksAPI/releaseOutput ./

ENTRYPOINT ["dotnet", "TechTalksAPI.dll"]
