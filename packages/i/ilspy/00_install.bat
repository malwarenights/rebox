@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\ilspy
if exist %TARGET% goto END

7z x -o%TARGET% ILSpy_binaries_3.0.0.3142.zip

:END
popd
