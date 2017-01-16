@ECHO OFF
setlocal
set _CMD_name=%~nx0
set _FolderPath=%~d0%~p0
SET PATH=%PATH%;%_FolderPath%_bin
cd /d "%_FolderPath%"
if /i "%*"=="" (echo.[!]ERROR: No cmd arg&echo.&echo.Use:&echo.7z_packer.cmd file_name arc_name&GOTO :ENDProc)
set _par2=%~2
if /i "%_par2%"=="" (set _par2=%~1)
7z a %_par2%.7z %~1 -mx=9 -m0=BCJ2 -m1=LZMA2:d=128m:fb=128:mc=1024 -m2=LZMA2:d=1m -m3=LZMA2:d=1m -mb0:1 -mb0s1:2 -mb0s2:3
:ENDProc
ENDLOCAL
exit /b /0