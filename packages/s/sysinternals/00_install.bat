rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\sysinternals
set PACKAGE=SysinternalsSuite-20180724.zip


if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
7z x %PACKAGE% -o%TARGET%

echo ==== Install the sysmon
%TARGET%\sysmon.exe -accepteula -h md5,sha1,sha256,imphash -i -n

echo ==== Update the configuration
%TARGET%\sysmon.exe -c sysmonconfig-rebox.xml

echo ==== Increase log size to 200 MB
wevtutil sl Microsoft-Windows-Sysmon/Operational /ms:209715200

echo ==== The events are written to Application and Services Logs/Microsoft/Windows/Sysmon/Operational log
echo ==== (For earlier -unsupported- versions of Windows, it places those under the Windows System log).


GOTO END
:END

echo ==== Accept EULA for the tools
reg.exe ADD HKCU\Software\Sysinternals /v EulaAccepted /t REG_DWORD /d 1 /f
reg.exe ADD HKU\.DEFAULT\Software\Sysinternals /v EulaAccepted /t REG_DWORD /d 1 /f

popd


