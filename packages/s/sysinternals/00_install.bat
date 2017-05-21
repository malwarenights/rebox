rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET="%SOFTWARE%\sysinternals"
set PACKAGE=SysinternalsSuite-20170516.zip


if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TARGET%

GOTO END
:END
popd


