@echo off
chcp 65001 >nul
title Discord + Vencord Installer

:: ===== Xin quyen Administrator =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cls
echo ==============================
echo   Discord + Vencord Installer
echo ==============================
echo.

:: ===== Thiet lap =====
set "FOLDER=%USERPROFILE%\Downloads"
set "DISCORD_URL=https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64"
set "VENCORD_URL=https://github.com/Vencord/Installer/releases/latest/download/VencordInstaller.exe"

set "DISCORD_EXE=%FOLDER%\DiscordInstaller.exe"
set "VENCORD_EXE=%FOLDER%\VencordInstaller.exe"

if not exist "%FOLDER%" mkdir "%FOLDER%"

:: ===== Tai file =====
echo Dang tai Discord...
curl -L --progress-bar "%DISCORD_URL%" -o "%DISCORD_EXE%"
if errorlevel 1 goto download_error

echo.
echo Dang tai Vencord...
curl -L --progress-bar "%VENCORD_URL%" -o "%VENCORD_EXE%"
if errorlevel 1 goto download_error

:: ===== Hoi nguoi dung =====
echo.
choice /C YN /M "Ban co muon mo installer de cai dat ngay bay gio khong"
if errorlevel 2 goto end

echo.
echo Dang mo installer...
start "" "%DISCORD_EXE%"
timeout /t 5 >nul
start "" "%VENCORD_EXE%"

:end
echo.
echo Hoan tat!
echo File installer nam trong thu muc Downloads.
pause
exit /b

:download_error
echo.
echo Co loi xay ra khi tai file!
pause
exit /b

