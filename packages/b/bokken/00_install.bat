@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\bokken
set PACKAGE=bokken-1.8-win32.exe

if exist %TARGET% goto END
%PACKAGE%



:END
popd
