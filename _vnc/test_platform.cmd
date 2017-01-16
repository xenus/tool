@echo off
if EXIST "%ProgramFiles(x86)%" (set xOS=64) else set xOS=32
echo.ver.1 %xOS%
set xOS=""

Set xOS=32& If Defined PROCESSOR_ARCHITEW6432 (Set xOS=64) Else If "%PROCESSOR_ARCHITECTURE%"=="AMD64" Set xOS=64
echo.ver.2 %xOS%
set xOS=""

ECHO "%PROCESSOR_ARCHITECTURE%""%PROCESSOR_ARCHITEW6432%"|1>NUL 2>NUL FIND /I "64"&&SET "xOS=64"||SET "xOS=32"
echo.ver.3 %xOS%
set xOS=""

::%SfxVarSystemPlatform%
if %1==x64 (set xOS=64) else set xOS=32
echo.ver.4 %xOS%
set xOS=""