FROM microsoft/dotnet:2.1.300-sdk  AS build-env


WORKDIR /TechTalksWeb
COPY NuGet.config ./
COPY TechTalksWeb.csproj ./


RUN dotnet restore

COPY . ./

RUN dotnet publish --configuration Release --output releaseOutput --no-restore

#build runtime image
FROM microsoft/dotnet:2.1.0-aspnetcore-runtime

WORKDIR /TechTalksWeb

COPY --from=build-env /TechTalksWeb/releaseOutput ./

ENTRYPOINT ["dotnet", "TechTalksWeb.dll"]
