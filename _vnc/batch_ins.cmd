@echo off 
echo Iinstall TightVNC
echo COPYING SETUP FILES to %%1... ... .. .
for /F "tokens=*" %%1 in (Computers.txt) do (
copy "tightvnc-2.8.5-setup-64bit.msi" "\\%%1\c$\users\public\documents"
copy "dfmirage-setup-2.0.301.exe" "\\%%1\c$\users\public\documents"
psexec \\%%1 -s msiexec /i "\\%%1\c$\users\public\documents\tightvnc-2.8.5-setup-64bit.msi" /quiet /norestart ^
ADDLOCAL=Server SET_ACCEPTHTTPCONNECTIONS=-1 SET_ACCEPTRFBCONNECTIONS=-1 SET_HTTPPORT=1 VALUE_OF_HTTPPORT=5800 ^
SET_RFBPORT=1 VALUE_OF_RFBPORT=5900 SET_REMOVEWALLPAPER=1 VALUE_OF_REMOVEWALLPAPER=1 ^
SET_RUNCONTROLINTERFACE=1 VALUE_OF_RUNCONTROLINTERFACE=-1 SET_USEMIRRORDRIVER=1 VALUE_OF_USEMIRRORDRIVER=1 ^
SET_DISCONNECTACTION=1 VALUE_OF_DISCONNECTACTION=1 SET_ALWAYSSHARED=1 VALUE_OF_ALWAYSSHARED=1 SET_NEVERSHARED=1 VALUE_OF_NEVERSHARED=0 ^
SET_DISCONNECTCLIENTS=1 VALUE_OF_DISCONNECTCLIENTS=0 SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 ^
SET_USEVNCAUTHENTICATION=-1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=Rjktcj SET_PASSWORD=1 VALUE_OF_PASSWORD=VncPass2016 ^
SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=0000 SET_SAVELOGTOALLUSERSPATH=1 VALUE_OF_SAVELOGTOALLUSERSPATH=1
psexec \\%%1 -s "\\%%1\c$\users\public\documents\dfmirage-setup-2.0.301.exe" /verysilent /norestart
echo CLEANING UP .. .. .
del /f "\\%%1\C$\users\public\documents\tightvnc-2.8.5-setup-64bit.msi"
del /f "\\%%1\C$\users\public\documents\dfmirage-setup-2.0.301.exe"
)
echo FINISHED!
pause