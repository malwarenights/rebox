rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET="%SOFTWARE%\git"
set PACKAGE32=Git-2.13.0-32-bit.exe
set PACKAGE64=Git-2.13.0-64-bit.exe

if exist "%TARGET%" goto END

@rem Add path of the git directory to the system PATH
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /d "%PATH%;%TARGET%\bin;%TARGET%\usr\bin" /f

@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==64BIT goto INSTALL64

:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
COPY %PACKAGE32% %TEMP%\%PACKAGE32%
%TEMP%\%PACKAGE32% /SILENT /DIR=%TARGET%
DEL %TEMP%\%PACKAGE32%
GOTO END



:INSTALL64
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
COPY %PACKAGE64% %TEMP%\%PACKAGE64%
%TEMP%\%PACKAGE64% /SILENT /DIR=%TARGET%
DEL %TEMP%\%PACKAGE64%
GOTO END



:END
popd


