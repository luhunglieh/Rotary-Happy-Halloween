@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ts = Get-Date -Format 'yyyyMMdd_HHmmss'; ^
     $backupDir = '..\Happy-Halloween-Backups'; ^
     if (!(Test-Path $backupDir)) { New-Item -ItemType Directory -Path $backupDir | Out-Null }; ^
     Write-Host '[1/2] 正在建立 Git 鏡像備份 (.bundle)...' -ForegroundColor Cyan; ^
     git bundle create \"$backupDir\Rotary-Happy-Halloween_$ts.bundle\" --all; ^
     Write-Host \"      -> 已建立: $backupDir\Rotary-Happy-Halloween_$ts.bundle\" -ForegroundColor Green; ^
     Write-Host '[2/2] 正在建立純源碼壓縮包 (.zip)...' -ForegroundColor Cyan; ^
     $exclude = @('_site', '.jekyll-cache', '.sass-cache', 'vendor', '.bundle', '.git', '_archive', 'Document-slides'); ^
     $files = Get-ChildItem -Path '.' -Exclude $exclude | Select-Object -ExpandProperty FullName; ^
     Compress-Archive -Path $files -DestinationPath \"$backupDir\Rotary-Happy-Halloween_src_$ts.zip\" -Force; ^
     Write-Host \"      -> 已建立: $backupDir\Rotary-Happy-Halloween_src_$ts.zip\" -ForegroundColor Green; ^
     Write-Host '========================================================' -ForegroundColor Yellow; ^
     Write-Host '  備份完成！儲存目錄: ..\Happy-Halloween-Backups' -ForegroundColor Yellow; ^
     Write-Host '========================================================' -ForegroundColor Yellow;"
pause
