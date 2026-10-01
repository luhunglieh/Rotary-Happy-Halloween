@echo off
chcp 65001 >nul
setlocal

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
set /p COMMIT_MSG="請輸入本次提交摘要（直接按 Enter 則使用自動時間戳記）: "
if "%COMMIT_MSG%"=="" (
    for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set CDATE=%%a-%%b-%%c
    for /f "tokens=1-2 delims=: " %%a in ('time /t') do set CTIME=%%a:%%b
    set COMMIT_MSG=update: !CDATE! !CTIME!
)

echo.
echo [2/4] 加入所有變更檔案至暫存區...
git add -A

echo.
echo [3/4] 建立版本提交 (Commit)...
git commit -m "%COMMIT_MSG%"

echo.
echo [4/4] 推送至 GitHub (origin main)...
git push -u origin main

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
