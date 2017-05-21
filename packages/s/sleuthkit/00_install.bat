rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET="%SOFTWARE%\sleuthkit-4.4.0-win32"
set PACKAGE32=sleuthkit-4.4.0-win32.zip


if exist "%TARGET%" goto END

@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT goto INSTAL32

:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
7z x %PACKAGE32% -o%SOFTWARE%
GOTO END



:END
popd


