@echo off
chcp 65001 >nul
echo ========================================================
echo   萬聖節大手牽小手活動 官方網站 - 本地預覽啟動器
echo ========================================================
echo.

where bundle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [INFO] 偵測到 Ruby 環境，正在啟動 Jekyll 伺服器...
    start http://localhost:4000/
    bundle exec jekyll serve --baseurl "/"
) else (
    echo [INFO] 未偵測到 Ruby，改用 Python 伺服器預覽編譯後網站...
    start http://localhost:4000/
    python -m http.server 4000 --directory _site
)
pause
