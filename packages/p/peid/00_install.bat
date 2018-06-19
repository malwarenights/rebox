rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\peid
set PACKAGE=PEiD-0.95-20081103.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TARGET%

:END
popd


