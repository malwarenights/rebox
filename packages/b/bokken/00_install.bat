@echo off
pushd "%~dp0"

set TARGET=c:\software\bokken
set PACKAGE=bokken-1.8-win32.exe

if exist %TARGET% goto END
%PACKAGE%



:END
popd
