@echo off
call tools\build-win32-release.bat
pushd artifacts\win32\bench\Release
bench.exe %*
popd 
