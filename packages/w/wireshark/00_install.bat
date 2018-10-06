rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\wireshark
set PACKAGE32=Wireshark-win32-2.6.3.exe
set PACKAGE64=Wireshark-win64-2.6.3.exe

if exist "%TARGET%" goto END


@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==64BIT goto INSTALL64

:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
COPY %PACKAGE32% %TEMP%\%PACKAGE32%
%TEMP%\%PACKAGE32% /S /D=%TARGET%
DEL %TEMP%\%PACKAGE32%
GOTO END



:INSTALL64
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
COPY %PACKAGE64% %TEMP%\%PACKAGE64%
%TEMP%\%PACKAGE64% /S /D=%TARGET%
DEL %TEMP%\%PACKAGE64%
GOTO END



:END
popd


