@echo off
pushd "%~dp0"

set TARGET=C:\software\far
set PACKAGE32=Far30b4900.x86.20170221.7z
set PACKAGE64=Far30b4900.x64.20170221.7z

if exist "%TARGET%" goto END


@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==64BIT goto INSTALL64

:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
7z x -aoa -o%TARGET% %PACKAGE32%
GOTO END



:INSTALL64
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
7z x -aoa -o%TARGET% %PACKAGE64%
GOTO END



:END
popd


