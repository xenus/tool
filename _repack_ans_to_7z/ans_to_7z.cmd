@ECHO OFF
set _FolderPath=%~d0%~p0
cd /d "%_FolderPath%"
cls
For /F "tokens=*" %%i in ('dir "%_FolderPath%ans.*.rar" /B 2^>Nul') do (start /B /wait 7z_repacker.cmd %%i)
GOTO :EOF