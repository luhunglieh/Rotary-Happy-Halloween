@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================================
echo   萬聖節活動專案 - 完整本機備份工具 (Git Bundle + Zip)
echo ========================================================
echo.

set TIMESTAMP=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set TIMESTAMP=%TIMESTAMP: =0%
set BACKUP_DIR=..\Happy-Halloween-Backups

if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

echo [1/2] 正在建立 Git 鏡像備份 (.bundle)...
where git >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    git bundle create "%BACKUP_DIR%\Happy-Halloween_%TIMESTAMP%.bundle" --all
    echo       -> 鏡像備份已建立: %BACKUP_DIR%\Happy-Halloween_%TIMESTAMP%.bundle
) else (
    echo [WARN] 未安裝 Git，略過 Bundle 備份。
)

echo.
echo [2/2] 正在建立乾淨源碼壓縮包 (.zip，排除快取與編譯檔)...
powershell -NoProfile -Command "$exclude = @('_site', '.jekyll-cache', '.sass-cache', 'vendor', '.bundle', '.git'); $files = Get-ChildItem -Path '.' -Exclude $exclude | Select-Object -ExpandProperty FullName; Compress-Archive -Path $files -DestinationPath '%BACKUP_DIR%\Happy-Halloween_src_%TIMESTAMP%.zip' -Force"
echo       -> 壓縮包已建立: %BACKUP_DIR%\Happy-Halloween_src_%TIMESTAMP%.zip

echo.
echo ========================================================
echo   備份完成！所有檔案存放在上層目錄: %BACKUP_DIR%
echo ========================================================
pause
