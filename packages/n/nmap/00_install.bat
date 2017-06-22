rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\nmap
set PACKAGE32=nmap-7.40-setup.exe

if exist "%TARGET%" goto END



echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
COPY %PACKAGE32% %TEMP%\%PACKAGE32%
%TEMP%\%PACKAGE32% /S /D=%TARGET%
DEL %TEMP%\%PACKAGE32%



:END
popd


