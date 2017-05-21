@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\autoit3^M

SET PACKAGE=autoit-v3-setup.exe
if exist %TARGET% goto END

COPY %PACKAGE% %TEMP%\%PACKAGE%
%TEMP%\%PACKAGE% /S /D=%TARGET%
DEL %TEMP%\%PACKAGE%

:END
popd
