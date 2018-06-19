rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\procdot
set PACKAGE=procdot_1_2_55_windows.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TARGET%

:END
popd


