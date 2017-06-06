rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\pafish
set PACKAGE=pafish-0.5.8.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z e %PACKAGE% -o%TARGET% "*/pafish.exe"

:END
popd


