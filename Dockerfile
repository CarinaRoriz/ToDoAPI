FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN mkdir /app
WORKDIR /app

COPY TodoApi.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

EXPOSE 5000/tcp
CMD ["dotnet", "out/dotnetapp.dll"]
