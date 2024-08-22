@echo off
setlocal
title Clash For Windows Installer

REM 检查是否为管理员
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请以管理员身份运行。
    pause
    exit /b
)
if not exist "C:\tmp\" (
    mkdir "C:\tmp\"
) 


REM 下载文件
echo 正在下载应用，这可能需要几分钟的时间...
powershell -Command "Start-BitsTransfer -Source 'http://example.com/' -Destination 'C:\tmp\clashforwiondows.zip'"

REM 检查下载是否成功
if not exist "C:\tmp\clashforwiondows.zip" (
    echo 下载失败，请保持网络畅通后再试。
    pause
    exit /b
  )
if not exist "C:\Program Files\Clash For Windows" (
    mkdir "C:\Program Files\Clash For Windows"
) 


REM 解压缩文件
echo 正在展开文件...
powershell -Command "Expand-Archive -Path 'C:\tmp\clashforwiondows.zip' -DestinationPath 'C:\Program Files\Clash For Windows\' -Force"
echo 解压缩完成
    
REM 创建桌面快捷方式
echo 正在尝试创建桌面快捷方式
powershell -Command "Start-BitsTransfer -Source 'http://example.com/' -Destination 'C:\Users\Public\Desktop\Clash For Windows.lnk'"
echo 创建桌面快捷方式完成！

REM 删除下载的压缩文件
echo 正在清理临时文件...
del "C:\tmp\clashforwiondows.zip"
echo 清理完成！

REM 询问用户是否破解文件以汉化界面
set /p choice="是否破解文件以汉化界面？(y/n): "

if /i "%choice%"=="n" (
   echo 完成！。
   start "" "http://example.com/"
   exit /b
)

echo 文件破解过程中请勿运行软件，如有运行，请彻底关闭后再进行破解
echo 我们将会在10秒后开始破解
timeout /t 10 

echo 破解文件中...

REM 下载破解文件
echo 正在下载补丁文件...
powershell -Command "Start-BitsTransfer -Source 'http://example.com/' -Destination 'C:\tmp\app.asar'"

REM 检查下载是否成功
if not exist "C:\tmp\app.asar" (
   echo 下载补丁文件失败，请保持网络畅通后再试。
   pause
   exit /b
)

 move "C:\tmp\app.asar" "C:\Program Files\Clash For Windows\resources"

 REM 检查文件是否成功移动
 if exist "C:\Program Files\Clash For Windows\resources\app.asar" (
 echo 破解成功！
 ) 


REM 跳转到指定网站并退出程序
echo 安装完成！
start "" "http://example.com/"
endlocal
pause
