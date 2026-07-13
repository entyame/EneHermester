@echo off
chcp 65001 >nul
cd /d "%~dp0apps\desktop"

echo ============================================
echo   EneHermes Desktop - 启动中...
echo ============================================

:: 清除 ELECTRON_RUN_AS_NODE（关键！否则 Electron 无法正常工作）
set ELECTRON_RUN_AS_NODE=

:: 设置 Hermes 后端路径
set HERMES_DESKTOP_HERMES_ROOT=%~dp0
set HERMES_HOME=%~dp0workspace

:: 检查依赖
if not exist "%~dp0node_modules" (
    echo [错误] 请先运行: cd "%~dp0" ^&^& npm install
    pause
    exit /b 1
)

:: 启动桌面应用（开发模式）
echo 启动 Vite 开发服务器 + Electron...
echo 窗口即将出现，请稍候...
echo.
npm run dev

pause
