@echo off
pushd "%~dp0"

SET PACKAGE=AcroRdrDC1900820071_en_US.exe

if exist "%TEMP%\%PACKAGE%.token" goto SKIP

COPY %PACKAGE% "%TEMP%\%PACKAGE%"
"%TEMP%\%PACKAGE%" /msi EULA_ACCEPT=YES /passive
DEL "%TEMP%\%PACKAGE%"

echo ===Installed=== > "%TEMP%\%PACKAGE%.token"

goto END

:SKIP
echo === Skiping already installed

:END
popd



