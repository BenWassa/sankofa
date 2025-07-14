@echo off
title Project Sankofa - Repository Status
color 0E
echo.
echo ================================================
echo   PROJECT SANKOFA - REPOSITORY STATUS
echo ================================================
echo.
cd /d "%~dp0\.."
python "utilities\scripts\repo-status\generate_status_v2.py"
echo.
echo Status report generated!
choice /C YN /M "Open the status report now"
if errorlevel 2 goto end
if exist "utilities\scripts\repo-status\repo_status_sankofa.txt" (
    start notepad "utilities\scripts\repo-status\repo_status_sankofa.txt"
)
:end
pause