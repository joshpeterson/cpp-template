@echo off

echo Building in debug for win32
call tools\build-win32-debug.bat || exit /b 1

echo Building in release for win32
call tools\build-win32-release.bat || exit /b 1

echo Building in debug for win64
call tools\build-win64-debug.bat || exit /b 1

echo Building in release for win64
call tools\build-win64-release.bat || exit /b 1
