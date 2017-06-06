rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\lordpe
set PACKAGE=Bin_LordPE_2010-6-29_3.9_LordPE_1.41_Deluxe_b.zip

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TEMP%
7z x %TEMP%\LPE-DLX_1.4.zip -o%TARGET%
7z x %TEMP%\LPE-DLXb_1.41_UPD.zip -o%TARGET% -y
del %TEMP%\LPE*.zip

:END
popd


