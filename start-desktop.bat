@echo off
cd /d "%~dp0apps\desktop"

:: 清除 ELECTRON_RUN_AS_NODE（关键！否则 Electron 无法正常工作）
set ELECTRON_RUN_AS_NODE=

:: 设置 Hermes 后端路径
set HERMES_DESKTOP_HERMES_ROOT=%~dp0
set HERMES_HOME=%~dp0workspace

:: 检查依赖
if not exist "%~dp0node_modules" (
    start "EneHermes 安装提示" cmd /c "echo 请先运行: cd %~dp0 ^&^& npm install && pause"
    exit /b 1
)

:: 启动桌面应用
npm run dev
exit
