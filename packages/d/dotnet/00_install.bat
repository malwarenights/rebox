@echo off
pushd "%~dp0"

echo ===== Install .NET runtime 
echo ===== Chocolatey needs 4.0+, dnSpy needs 4.6+
SET PACKAGE40=dotNetFx40_Full_x86_x64.exe
SET PACKAGE45=dotNetFx45_Full_x86_x64.exe
SET PACKAGE462=NDP462-KB3151800-x86-x64-AllOS-ENU.exe
SET PACKAGE47=NDP47-KB3186497-x86-x64-AllOS-ENU.exe
SET KB_D3D=Windows6.1-KB4019990-x86.msu
SET KB_D3D_64=Windows6.1-KB4019990-x64.msu
SET KB_CERTS=Windows6.1-KB2813430-x86.msu
SET KB_CERTS_64=Windows6.1-KB2813430-x64.msu


if exist "%TEMP%\%PACKAGE47%.token" goto SKIP


echo ===== 4.7 needs KB4019990 - D3D Compiler
wusa.exe %KB_D3D% /quiet /norestart
wusa.exe %KB_D3D_64% /quiet /norestart

echo ===== 4.7 needs KB2813430 - Update to trusted certs
rem wusa.exe %KB_CERTS% /quiet /norestart
rem wusa.exe %KB_CERTS_64% /quiet /norestart

rem certmgr.exe /add MicRooCerAut2011_2011_03_22.cer /s /r localMachine root
certutil -addstore "Root" MicRooCerAut2011_2011_03_22.crt


COPY %PACKAGE47% "%TEMP%\%PACKAGE47%"
"%TEMP%\%PACKAGE47%" /passive /norestart
DEL "%TEMP%\%PACKAGE47%"
echo ===Installed=== > "%TEMP%\%PACKAGE47%.token"


goto END
:SKIP
echo === Skiping already installed

:END
echo ===== Install .NET runtime finished
popd
