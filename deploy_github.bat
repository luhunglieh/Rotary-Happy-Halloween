@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================================
echo   萬聖節活動專案 - 一鍵推送至 GitHub (Rotary-Happy-Halloween)
echo ========================================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 系統未安裝或找不到 Git，請先確認 Git 環境變數。
    pause
    exit /b 1
)

echo [1/4] 檢查 Git 工作區狀態...
git status --short

echo.
set "COMMIT_MSG="
set /p COMMIT_MSG="請輸入本次提交摘要（直接按 Enter 則使用自動時間戳記）: "
if "%COMMIT_MSG%"=="" (
    for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"`) do set "COMMIT_MSG=update: %%i"
)

echo.
echo [2/4] 加入所有變更檔案至暫存區...
git add -A

echo.
echo [3/4] 建立版本提交 (Commit)...
git commit -m "%COMMIT_MSG%"

echo.
echo [4/4] 推送至 GitHub (origin main)...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo   推送成功！
    echo   專案網址: https://github.com/luhunglieh/Rotary-Happy-Halloween
    echo   Actions 自動發布: https://github.com/luhunglieh/Rotary-Happy-Halloween/actions
    echo   正式站台: https://luhunglieh.github.io/Rotary-Happy-Halloween/
    echo ========================================================
) else (
    echo.
    echo [ERROR] 推送失敗，請檢查權限或網路連線。
)

pause
