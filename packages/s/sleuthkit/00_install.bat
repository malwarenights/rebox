rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\sleuthkit-4.6.2
set PACKAGE32=sleuthkit-4.6.2-win32.zip


if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
7z x %PACKAGE32% -o%SOFTWARE%



:END
popd


