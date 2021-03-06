FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

RUN mkdir /app
WORKDIR /app

COPY TodoApi.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "TodoApi.dll"]