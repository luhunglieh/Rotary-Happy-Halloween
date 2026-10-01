@echo off
setlocal
echo [INFO] 正在檢查並終止 Port 4000 的 Web 伺服器行程...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":4000 " ^| findstr "LISTENING"') do (
    echo [INFO] 正在強制終止 PID: %%a
    taskkill /PID %%a /F /T >nul 2>&1
)
taskkill /IM ruby.exe /F /T >nul 2>&1
echo [OK] Web 伺服器已成功關閉。
timeout /t 2 >nul
