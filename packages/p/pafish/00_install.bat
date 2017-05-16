@echo off
pushd "%~dp0"

set TARGET=C:\software\7zip
set PACKAGE32=7z1602.exe
set PACKAGE64=7z1602-x64.exe

@rem Set the installation directory to "c:\software\7zip"
@rem reg add hkcu\Software\7-Zip /v Path /d "c:\software\7zip" /f
@rem reg add hkcu\Software\7-Zip /v Path64 /d "c:\software\7zip" /f
@rem run the installer silently

if exist "%TARGET%" goto END
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /d "%PATH%;%TARGET%" /f

echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
%PACKAGE32% /S /D=%TARGET%

if exist "%TARGET%" goto END
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
%PACKAGE64% /S /D=%TARGET%



:END
popd


