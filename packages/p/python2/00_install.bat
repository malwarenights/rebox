@echo off
pushd "%~dp0"

set TARGET32=C:\software\python27
set TARGET64=C:\software\python27x64
set PACKAGE32=python-2.7.13.msi
set PACKAGE64=python-2.7.13.amd64.msi


@rem Check the architecture
%SYSTEMROOT%\system32\reg.exe Query "HKLM\Hardware\Description\System\CentralProcessor\0" | c:\windows\system32\find.exe /i "x86" > NUL && set OS=32BIT || set OS=64BIT


:INSTALL64
if %OS%==32BIT goto INSTALL32

if exist "%TARGET64%" goto INSTALL32
echo ==== Installing %~dp0%PACKAGE64% to %TARGET64%
COPY %PACKAGE64% %TEMP%\%PACKAGE64%
%SYSTEMROOT%\system32\msiexec.exe /i %TEMP%\%PACKAGE64% ALLUSERS=1 ADDLOCAL=ALL TARGETDIR=%TARGET64% /quiet /norestart
DEL %TEMP%\%PACKAGE64%



@rem Let the Python 32bit be the last one to install and thus the default one
:INSTALL32
if exist "%TARGET32%" goto END
echo ==== Installing %~dp0%PACKAGE32% to %TARGET32%
COPY %PACKAGE32% %TEMP%\%PACKAGE32%
%SYSTEMROOT%\system32\msiexec.exe /i %TEMP%\%PACKAGE32% ALLUSERS=1 ADDLOCAL=ALL TARGETDIR=%TARGET32% /quiet /norestart
DEL %TEMP%\%PACKAGE32%

@rem Add path of the 7zip directory to the system PATH
@rem %SYSTEMROOT%\system32\reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /d "%PATH%;%TARGET32%;%TARGET32\Scripts" /f
%SYSTEMROOT%\system32\reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PYTHONHOME /d "%TARGET32%" /f
%SYSTEMROOT%\system32\reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATHONPATH /d "%TARGET32%\DLLs;%TARGET32%\Lib;%TARGET32%\Lib\site-packages" /f


:END
popd


