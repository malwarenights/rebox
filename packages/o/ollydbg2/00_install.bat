rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET="%SOFTWARE%\ollydbg2"
set PACKAGE=odbg201.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TARGET%
rem There is newer version in system
del "%TARGET%\dbghelp.dll"

:END
popd


