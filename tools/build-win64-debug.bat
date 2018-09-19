@echo off

if not exist "artifacts" mkdir artifacts

cd artifacts

if not exist "win64" mkdir win64

cd win64

cmake ..\.. -G "Visual Studio 15 2017 Win64" || exit /b 1

msbuild /nologo /verbosity:quiet /p:Configuration=Debug cpp-template.sln || exit /b 1

test\Debug\tests.exe || exit /b 1

cd ..\..