@echo off
setlocal
title Clash For Windows  Uninstall

REM 确认是否管理员  
net session >nul 2>&1
if %errorLevel% == 0 (
    REM 以管理员身份运行时的操作
) else (
    echo 请以管理员身份运行！
    pause
    exit /b
)

echo 是否确定卸载软件？(Y/N)
set /p input=
if /i "%input%"=="Y" (
    echo 正在卸载...
    rmdir /s /q "C:\Program Files\Clash for Windows"
    del "C:\Users\Public\Desktop\Clash For Windows.lnk"
    echo 是否删除用户配置文件？(Y/N)
    set /p input=
    if /i "%input%"=="Y" (
        rmdir /s /q "%USERPROFILE%\.config\clash"
        echo 卸载成功！
        start "" "http://example.com/"
        pause
        exit /b
    )
    else（
    echo 卸载成功！
    start "" "http://example.com/"
    pause
    exit /b
    ）
) else (
    echo 取消卸载！
    pause
)