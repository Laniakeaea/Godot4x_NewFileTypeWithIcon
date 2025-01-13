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

REM 在此处添加你的脚本内容
REM 定义文件类型
set FILE_TYPE=NewFile

REM 定义图标路径
set ICON_PATH=%~dp0NewFile.ico

REM 创建文件类型描述
ftype %FILE_TYPE%=""

REM 将文件后缀关联到文件类型
assoc .%FILE_TYPE%=%FILE_TYPE%

REM 设置图标
reg add "HKEY_CLASSES_ROOT\%FILE_TYPE%\DefaultIcon" /ve /t REG_SZ /d "%ICON_PATH%" /f

REM 检查是否成功
if %ERRORLEVEL% equ 0 (
    echo 文件类型 %FILE_TYPE% 已关联到图标 %ICON_PATH%
) else (
    echo 发生错误: %ERRORLEVEL%
)

pause