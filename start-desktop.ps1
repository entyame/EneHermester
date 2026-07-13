# EneHermester Desktop Launcher
$ErrorActionPreference = 'Stop'

# CRITICAL: Remove ELECTRON_RUN_AS_NODE from environment
# (cmd.exe "set VAR=" only empties it, PowerShell truly deletes it)
Remove-Item Env:ELECTRON_RUN_AS_NODE -ErrorAction SilentlyContinue

# Set backend paths
$Root = $PSScriptRoot
$env:HERMES_DESKTOP_HERMES_ROOT = $Root
$env:HERMES_HOME = Join-Path $Root 'workspace'

# Check dependencies
if (-not (Test-Path (Join-Path $Root 'node_modules'))) {
    Write-Host "[ERROR] Dependencies not installed." -ForegroundColor Red
    Write-Host "Run: cd '$Root' ; npm install"
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  EneHermester Desktop - Launching..." -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Launch
Set-Location (Join-Path $Root 'apps\desktop')
npm run dev
Read-Host "Press Enter to exit"
