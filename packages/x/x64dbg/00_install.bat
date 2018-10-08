rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\x64dbg
set PACKAGE=snapshot_2018-09-13_13-07.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TARGET%
pushd "%TARGET%\release"
move * ..
move x32  ..
move x64 ..
move translations ..
rmdir release
popd

:END
popd


