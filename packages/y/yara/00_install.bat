rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET="%SOFTWARE%\yara"
set PACKAGE32=yara-3.6.0-win32.zip
set PACKAGE64=yara-3.6.0-win64.zip

if exist "%TARGET%" goto END

@rem Add path of the 7zip directory to the system PATH
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /d "%PATH%;%TARGET%" /f

@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT goto INSTALL32



:INSTALL64
echo ==== Installing %~dp0%PACKAGE64% to %TARGET%
7z x %PACKAGE64% -o%TARGET%



:INSTALL32
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
7z x %PACKAGE32% -o%TARGET%

:END
popd


