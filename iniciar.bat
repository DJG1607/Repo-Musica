@echo off
title Reproductor de Musica
cd /d "%~dp0"

where node >nul 2>nul
if %errorlevel%==0 (
  echo Iniciando servidor con Node.js...
  start "" http://localhost:8080
  node server.js
  goto :end
)

where python >nul 2>nul
if %errorlevel%==0 (
  echo Iniciando servidor con Python...
  start "" http://localhost:8080
  python -m http.server 8080
  goto :end
)

where py >nul 2>nul
if %errorlevel%==0 (
  echo Iniciando servidor con Python launcher...
  start "" http://localhost:8080
  py -m http.server 8080
  goto :end
)

echo.
echo No se encontro Node.js ni Python.
echo Instala uno de los dos:
echo   - Node.js:  https://nodejs.org
echo   - Python:   https://python.org
echo.
pause

:end
