@echo off
pushd "%~dp0"

set TARGET=c:\software\ilspy
if exist %TARGET% goto END

7z x -o%TARGET% ILSpy_Master_2.4.0.1963_Binaries.zip

:END
popd
