rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\pchunter
set PACKAGE=PCHunter_free.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z e %PACKAGE% -o%TARGET%

:END
popd


