@echo off
:: Build + Pack
:: Usage: build.cmd [Release|Debug]

set CONFIG=%1
if "%CONFIG%"=="" set CONFIG=Release

echo === Build (%CONFIG%) ===
dotnet build src\Iciclecreek.Avalonia.TerminalWindow\Iciclecreek.Avalonia.Terminal.csproj -c %CONFIG%
if errorlevel 1 exit /b %errorlevel%

echo === Pack ===
dotnet pack src\Iciclecreek.Avalonia.TerminalWindow\Iciclecreek.Avalonia.Terminal.csproj -c %CONFIG% --no-build -o artifacts\
if errorlevel 1 exit /b %errorlevel%

echo === Done ===
