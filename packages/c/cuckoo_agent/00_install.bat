rem @echo off
pushd "%~dp0"


if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)

set TARGET=%SOFTWARE%\cuckoo_agent

if exist "%TARGET%" goto END

echo ==== Installing %~dp0%PACKAGE% to %TARGET%
mkdir "%TARGET%"
xcopy  agent*.* "%TARGET%\" /S

:END
popd


