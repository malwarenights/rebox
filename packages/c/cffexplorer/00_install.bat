@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\cffexplorer
set PACKAGE=ExplorerSuite.exe

if exist %TARGET% goto END
%PACKAGE% /silent /dir=%TARGET%



:END
popd
