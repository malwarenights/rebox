@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=%SystemDrive%\software)
set TARGET=%SOFTWARE%\pe-sieve
set PACKAGE32=pe-sieve32.exe
set PACKAGE64=pe-sieve64.exe

if exist "%TARGET%" goto END


mkdir %TARGET%
copy %PACKAGE32% %TARGET%
copy %PACKAGE64% %TARGET%

@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==64BIT goto INSTALL64

:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
copy %PACKAGE32% %TARGET%\pe-sieve.exe
GOTO END



:INSTALL64
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
copy %PACKAGE64% %TARGET%\pe-sieve.exe
GOTO END



:END
popd


