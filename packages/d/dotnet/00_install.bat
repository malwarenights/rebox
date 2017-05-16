@echo off
pushd "%~dp0"

echo ===== Install .NET runtime 
SET PACKAGE=NDP462-KB3151800-x86-x64-AllOS-ENU.exe

COPY %PACKAGE% %TEMP%\%PACKAGE%
%TEMP%\%PACKAGE% /q /norestart
DEL %TEMP%\%PACKAGE%


:END
echo ===== Install .NET runtime finished
popd
