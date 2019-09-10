@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=%SystemDrive%\software)
set TARGET=%SOFTWARE%\scdbg
set PACKAGE32=scdbg.zip
set PACKAGE64=scdbg.zip

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


