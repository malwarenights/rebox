rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\pestudio
set PACKAGE=pestudio-8.70.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%SOFTWARE%

:END
popd


