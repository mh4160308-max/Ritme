@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ==========================================
echo       ساخت اپلیکیشن ویندوزی ریتم
echo ==========================================
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js نصب نیست. نسخه LTS را از https://nodejs.org نصب کنید.
  pause
  exit /b 1
)
echo در حال نصب وابستگی‌ها؛ اتصال اینترنت لازم است...
call npm install
if errorlevel 1 goto error
echo در حال ساخت فایل‌های EXE...
call npm run dist
if errorlevel 1 goto error
echo.
echo ساخت تمام شد. فایل‌ها در پوشه dist قرار دارند.
explorer "%~dp0dist"
pause
exit /b 0
:error
echo ساخت ناموفق بود. متن خطا را بررسی کنید و دوباره تلاش کنید.
pause
exit /b 1
