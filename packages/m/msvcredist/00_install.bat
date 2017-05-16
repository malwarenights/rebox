rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

@rem Check the architecture
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

:INSTALL32
echo ==== Installing 32bit runtime
2005_vcredist_x86-6.00.2900.2180.exe /Q
2008_vcredist_x86-9.0.30729.5677.exe /q
2010_vcredist_x86-10.0.40219.1.exe /install /passive /norestart
2012_vcredist_x86-11.0.61030.exe /install /passive /norestart
2013_vcredist_x86-12.0.30501.exe /install /passive /norestart
2015_vcredist_x86-14.0.24215.1.exe /install /passive /norestart
2017_vc_redist.x86-14.10.25008.exe /install /passive /norestart

GOTO END


if %OS%==32BIT goto END
:INSTALL64
echo ==== Installing 64bit runtime
2005_vcredist_x64-6.00.2900.2180.exe /Q
2008_vcredist_x64-9.0.30729.5677.exe /q
2010_vcredist_x64-10.0.40219.01.exe /install /passive /norestart
2012_vcredist_x64-11.0.61030.exe /install /passive /norestart
2013_vcredist_x64-12.0.30501.exe /install /passive /norestart
2015_vcredist_x64-14.0.24215.1.exe /install /passive /norestart
2017_vc_redist.x64-14.10.25008.exe /install /passive /norestart
GOTO END



:END
popd


