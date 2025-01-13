@echo off
:: 检查是否具有管理员权限
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"

:: 如果没有管理员权限，则重新启动脚本并请求管理员权限
if '%errorlevel%' NEQ '0' (
    echo 请求管理员权限...
    goto :UACPrompt
) else ( goto :gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

REM 删除文件类型关联和图标设置
set FILE_TYPE=NewFile

reg delete "HKEY_CLASSES_ROOT\%FILE_TYPE%\DefaultIcon" /f

REM 检查是否成功删除
if %ERRORLEVEL% equ 0 (
    echo 注册表项 %FILE_TYPE% 已删除
) else (
    echo 发生错误: %ERRORLEVEL%
)

pause