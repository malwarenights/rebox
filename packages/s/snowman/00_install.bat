rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\snowman
set PACKAGE32=snowman-v0.1.3-win-x86.7z
set PACKAGE64=snowman-v0.1.3-win-x64.7z


if exist "%TARGET%" goto END

@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT goto INSTAL32

:INSTALL64
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
7z x %PACKAGE64% -o%TARGET%

:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
7z x %PACKAGE32% -o%TARGET%
GOTO END



:END
popd


