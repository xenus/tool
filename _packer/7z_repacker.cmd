@ECHO OFF
setlocal enabledelayedexpansion enableextensions
set _CMD_name=%~nx0
set _FolderPath=%~d0%~p0
SET PATH=%PATH%;%_FolderPath%_bin
cd /d "%_FolderPath%"
if /i "%*"=="" (echo.[!]ERROR: No cmd arg&echo.&echo.Use:&echo.7z_repacker.cmd in_arc_file_name.rar&GOTO :ENDProc)

echo.# init
set _par1=%~1
::TODO сравнить %_par1% с текущим диском, откорректировать в случае необходимостри
if exist .\tmp (call :_RD .\tmp)
echo.# unpack[%_par1%]
call :_UnPack %_par1%
For /F "tokens=*" %%i in ('dir .\tmp\CONS#*.ans /B 2^>Nul') do (set _par0=%%i)
set _par0=%_par0:CONS#DD=%
set _par0=%_par0:#0000.ANS=%
set _par0=%_par0:#0001.ANS=%
set _par0=%_par0:#0002.ANS=%
set _par0=ans.16%_par0:#0003.ANS=%
echo.# pack[%_par0%.7z]
call :_Pack %_par0% *.ans
GOTO :ENDProc


:_UnPack
  7z e -otmp -y %~1 >Nul
  exit /b /0

:_Pack
  7z a %~1.7z .\tmp\%~2 -mx=9 -m0=BCJ2 -m1=LZMA2:d=128m:fb=128:mc=1024 -m2=LZMA2:d=1m -m3=LZMA2:d=1m -mb0:1 -mb0s1:2 -mb0s2:3 >Nul
  exit /b /0

:_RD
  del /F /S /Q %~1\* >Nul 2>Nul
  ping -n 2 127.0.0.1 >Nul 2>Nul
  rmdir /S /Q %~1 >Nul 2>Nul
  exit /b /0

:ENDProc
ENDLOCAL
exit /b /0
GOTO :EOF