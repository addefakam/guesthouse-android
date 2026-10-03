@echo off
echo ==========================================
echo  Guesthouse Android Setup
echo ==========================================
echo.

echo [1/5] Removing old android folder...
if exist android rmdir /s /q android

echo [2/5] Creating www directory...
if not exist www mkdir www
if not exist www\index.html echo ^<html^>^<^/html^> > www\index.html

echo [3/5] Adding android platform...
call npx cap add android

echo [4/5] Creating assets directory manually...
if not exist android\app\src\main\assets mkdir android\app\src\main\assets
if not exist android\app\src\main\assets\public mkdir android\app\src\main\assets\public

echo [5/5] Syncing...
call npx cap sync android

echo.
echo ==========================================
echo  Done! Now run:
echo  npx cap open android
echo ==========================================
pause
