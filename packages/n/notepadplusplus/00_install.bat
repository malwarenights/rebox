@echo on
pushd "%~dp0"

set TARGET=c:\software\notepad++
set PACKAGE32=npp.7.5.8.Installer.exe


if exist "C:\%TARGET%" goto END
echo ==== Installing %~dp0%PACKAGE32% to %TARGET%
%PACKAGE32% /S /D=%TARGET%


:END
popd


