@echo off
pushd "%~dp0"

echo ===== Install .NET runtime 
SET PACKAGE40=dotNetFx40_Full_x86_x64.exe
SET PACKAGE462=NDP462-KB3151800-x86-x64-AllOS-ENU.exe

if exist "%TEMP%\%PACKAGE40%.token" goto SKIP

COPY %PACKAGE40% "%TEMP%\%PACKAGE40%"
"%TEMP%\%PACKAGE40%" /passive /norestart
DEL "%TEMP%\%PACKAGE40%"

COPY %PACKAGE462% "%TEMP%\%PACKAGE462%"
"%TEMP%\%PACKAGE462%" /passive /norestart
DEL "%TEMP%\%PACKAGE462%"
echo ===Installed=== > "%TEMP%\%PACKAGE40%.token"


goto END
:SKIP
echo === Skiping already installed

:END
echo ===== Install .NET runtime finished
popd
