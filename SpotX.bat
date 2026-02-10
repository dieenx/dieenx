@echo off
chcp 65001 >nul
title SpotX Spotify Patcher

:: ===== Tu dong xin quyen Administrator =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cls
echo ===============================
echo    SpotX Spotify Patcher
echo ===============================
echo.

:: ===== Chay SpotX =====
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"iex \"& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify\""

echo.
echo Hoan tat!
pause
exit /b