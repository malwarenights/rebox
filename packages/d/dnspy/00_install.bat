@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\dnspy
if exist %TARGET% goto END

7z x -o%TARGET% dnSpy.zip

:END
popd
