@echo off
call tools\build-win64-release.bat
pushd artifacts\win64\bench\Release
bench.exe %*
popd
