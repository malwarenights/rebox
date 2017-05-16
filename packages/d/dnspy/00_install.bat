@echo off
pushd "%~dp0"

set TARGET=c:\software\dnspy
if exist %TARGET% goto END

7z x -o%TARGET% dnSpy.zip

:END
popd
