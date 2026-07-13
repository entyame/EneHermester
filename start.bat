@echo off
chcp 65001 >nul
cd /d "E:\Internship Projects\RuyiHermesAgent"
powershell -ExecutionPolicy Bypass -File "run.ps1"
pause
